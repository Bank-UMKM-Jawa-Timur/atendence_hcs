import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/pengkinian_data/controllers/list_pengkinian_data_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_short_two_caracter_name.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengkinianDataPage extends StatefulWidget {
  const PengkinianDataPage({super.key});

  @override
  State<PengkinianDataPage> createState() => _PengkinianDataPageState();
}

class _PengkinianDataPageState extends State<PengkinianDataPage> {
  ListPengkinianDataController listPengkinianC =
      Get.find<ListPengkinianDataController>();
  String nip = Get.arguments[0]['nip'];
  String nama = Get.arguments[1]['nama'];
  var page = 1;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    listPengkinianC.getListPengkinianData(nip, page);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        _fetchPage();
      }
    });
  }

  _fetchPage() {
    setState(() {
      page++;
    });
    listPengkinianC.getListPengkinianData(nip, page);
    setState(() {});
  }

  clearData() {
    page = 1;
    listPengkinianC.listPengkinianDataM?.data.clear();
    setState(() {});
    listPengkinianC.getListPengkinianData(nip, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: AppBar(
        title: const Text(
          "Pengkinian Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: cPrimary,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            color: cPrimary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    RouteNames.searchKaryawan,
                    arguments: RouteNames.pengkinianData,
                  );
                },
                child: Container(
                  width: Get.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.search,
                            color: cGrey_900,
                            size: 22,
                          ),
                        ),
                        spaceWidth(8),
                        Expanded(
                          flex: 10,
                          child: Text(
                            nip == "" ? nama : "$nip - $nama",
                            style: const TextStyle(
                              color: cGrey_900,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => page == 1
                ? listPengkinianC.isLoading.value
                    ? loadingPage()
                    : listPengkinianC.isEmptyData.value
                        ? Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: emtyPage(
                              "Pengkinian Data Untuk $nama masih kosong!",
                            ),
                          )
                        : cardDataItems()
                : cardDataItems(),
          )
        ],
      ),
    );
  }

  Expanded cardDataItems() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          clearData();
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          controller: controller,
          itemCount: listPengkinianC.listPengkinianDataM!.data.length,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < listPengkinianC.listPengkinianDataM!.data.length) {
              return cardListData(
                listPengkinianC.listPengkinianDataM?.data[index].nip ?? '-',
                listPengkinianC.listPengkinianDataM?.data[index].namaKaryawan ??
                    '-',
                listPengkinianC.listPengkinianDataM?.data[index].namaBagian ??
                    '-',
                listPengkinianC.listPengkinianDataM?.data[index].nik ?? '-',
                listPengkinianC.listPengkinianDataM?.data[index].kantor ?? '-',
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: !listPengkinianC.isEmptyData.value
                      ? (listPengkinianC.listPengkinianDataM!.data.length /
                                  page) >=
                              10
                          ? Column(
                              children: [
                                spaceHeight(100),
                                const CircularProgressIndicator(),
                                spaceHeight(30),
                              ],
                            )
                          : Container()
                      : Text(
                          "Tidak ada data lagi.",
                          style:
                              customTextStyle(FontWeight.w400, 15, cGrey_900),
                        ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Padding cardListData(
    nip,
    nama,
    String jabatan,
    String nik,
    String kantor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: cGrey_400,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: const BoxDecoration(
                            color: cPrimary_300,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              shortTwoCaracterName(nama),
                              style: customTextStyle(
                                FontWeight.w800,
                                15,
                                cPrimary,
                              ),
                            ),
                          ),
                        ),
                        spaceWidth(10),
                        SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shortenLastName(nama),
                                style: customTextStyle(
                                  FontWeight.w700,
                                  14,
                                  Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                nip,
                                style: customTextStyle(
                                  FontWeight.w600,
                                  12,
                                  cGrey_700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // const Icon(
                    //   CommunityMaterialIcons.card_account_details_outline,
                    //   color: cGrey_700,
                    // )
                  ],
                ),
                spaceHeight(15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nik",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              nik,
                              style: customTextStyle(
                                FontWeight.w800,
                                13,
                                cGrey_600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kantor",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              kantor,
                              style: customTextStyle(
                                FontWeight.w800,
                                13,
                                cGrey_600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
