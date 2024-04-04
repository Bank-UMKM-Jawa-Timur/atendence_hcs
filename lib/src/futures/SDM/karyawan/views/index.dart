import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/karyawan/controllers/list_karyawan_controller.dart';
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

class KaryawanPage extends StatefulWidget {
  const KaryawanPage({super.key});

  @override
  State<KaryawanPage> createState() => _KaryawanPageState();
}

class _KaryawanPageState extends State<KaryawanPage> {
  ListKaryawanController listKaryawanC = Get.find<ListKaryawanController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  int page = 1;
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        _fetchPage();
      }
    });
    clearData();
    listKaryawanC.getListKaryawan(nip, page);
  }

  clearData() {
    page = 1;
    listKaryawanC.listKaryawanM?.data.clear();
  }

  _fetchPage() {
    setState(() {
      page++;
    });
    listKaryawanC.getListKaryawan(nip, page);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: AppBar(
        title: const Text(
          "Data Karyawan",
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
                    arguments: RouteNames.karyawanList,
                  );
                },
                child: Container(
                  width: Get.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
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
                            nip == ""
                                ? nama
                                : "$nip - ${shortenLastName(nama)}",
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
          Obx(() => page == 1
              ? listKaryawanC.isLoading.value
                  ? loadingPage()
                  : listKaryawanC.isEmptyData.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: emtyPage("Data untuk $nama kosong!"),
                        )
                      : cardDataItems()
              : cardDataItems())
        ],
      ),
    );
  }

  Expanded cardDataItems() {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        padding: const EdgeInsets.only(top: 10),
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: listKaryawanC.listKaryawanM!.data.length,
        itemBuilder: (context, index) {
          if (index < listKaryawanC.listKaryawanM!.data.length) {
            return cardListData(
              listKaryawanC.listKaryawanM?.data[index].namaKaryawan ?? '-',
              listKaryawanC.listKaryawanM?.data[index].displayJabatan
                      .toString()
                      .trim() ??
                  '-',
              listKaryawanC.listKaryawanM?.data[index].nik ?? '-',
              listKaryawanC.listKaryawanM?.data[index].namaCabang ?? '-',
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: !listKaryawanC.isEmptyData.value
                    ? const CircularProgressIndicator()
                    : Text(
                        "Tidak ada data lagi.",
                        style: customTextStyle(FontWeight.w400, 15, cGrey_900),
                      ),
              ),
            );
          }
        },
      ),
    );
  }

  Padding cardListData(
    String nama,
    String jabatan,
    String nik,
    String kantor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteNames.profileSaya, arguments: {
            'nip': Get.arguments[0]['nip'],
            'title': "Detail Karyawan",
          });
        },
        child: Container(
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: cGrey_400,
                blurRadius: 4,
                offset: Offset(0, 1),
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
                            jabatan,
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

  Column emptyData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        spaceHeight(60),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Image(
            image: AssetImage('assets/images/empty_data.png'),
          ),
        ),
        Text(
          "Silahkan cari data karyawan untuk\nmenampilkan data karyawan",
          textAlign: TextAlign.center,
          style: customTextStyle(FontWeight.w500, 15, Colors.black),
        )
      ],
    );
  }
}
