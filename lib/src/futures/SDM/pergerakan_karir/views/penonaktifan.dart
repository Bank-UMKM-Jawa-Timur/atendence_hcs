import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/controllers/penonaktifan_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenonaktifanPage extends StatefulWidget {
  const PenonaktifanPage({super.key});

  @override
  State<PenonaktifanPage> createState() => _PenonaktifanPageState();
}

class _PenonaktifanPageState extends State<PenonaktifanPage> {
  PenonaktifanController penonaktifanC = Get.find<PenonaktifanController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  var page = 1;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    if (nip != "") {
      penonaktifanC.getListPenonaktifan(nip, page);
    }
    penonaktifanC.getListPenonaktifan(nip, page);
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
    penonaktifanC.getListPenonaktifan(nip, page);
    setState(() {});
  }

  clearData() {
    page = 1;
    penonaktifanC.penonaktifanM?.data.clear();
    setState(() {});
    penonaktifanC.getListPenonaktifan(nip, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: AppBar(
        title: const Text(
          "Penonaktifan",
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
                    arguments: RouteNames.penonaktifan,
                  );
                },
                child: Container(
                  width: Get.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
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
                ? penonaktifanC.isLoading.value
                    ? loadingPage()
                    : penonaktifanC.isEmptyData.value
                        ? emtyPage("Penonaktifan $nama Masih Kosong!")
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
        backgroundColor: cPrimary,
        color: Colors.white,
        onRefresh: () async {
          clearData();
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15),
          controller: controller,
          itemCount: penonaktifanC.penonaktifanM!.data.length,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < penonaktifanC.penonaktifanM!.data.length) {
              return cardItems(
                index + 1,
                penonaktifanC.penonaktifanM?.data[index].nip,
                penonaktifanC.penonaktifanM?.data[index].namaKaryawan,
                penonaktifanC.penonaktifanM?.data[index].nik ?? '-',
                penonaktifanC.penonaktifanM?.data[index].kategoriPenonaktifan ??
                    '-',
                penonaktifanC.penonaktifanM?.data[index].namaCabang ?? '-',
                penonaktifanC.penonaktifanM?.data[index].displayJabatan
                        ?.trim() ??
                    '-',
                penonaktifanC.penonaktifanM?.data[index].tanggalPenonaktifan
                        .toString() ??
                    '-',
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: !penonaktifanC.isEmptyData.value
                      ? (penonaktifanC.penonaktifanM!.data.length / page) >= 10
                          ? const CircularProgressIndicator()
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

  Padding cardItems(
    int no,
    nip,
    nama,
    nik,
    katPenonaktifan,
    kantorTerakhir,
    jabatanTerakhir,
    tglPenonaktifan,
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
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(15),
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
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: cPrimary_300,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              // shortTwoCaracterName(nama),
                              no.toString(),
                              style: customTextStyle(
                                FontWeight.w800,
                                16,
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
                  ],
                ),
                spaceHeight(15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NIK",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              nik,
                              style: customTextStyle(
                                FontWeight.w700,
                                13,
                                cGrey_600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    spaceWidth(10),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kat Penonaktifan",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              katPenonaktifan,
                              style: customTextStyle(
                                FontWeight.w700,
                                13,
                                cGrey_600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                spaceHeight(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kantor Terakhir",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              kantorTerakhir,
                              style: customTextStyle(
                                FontWeight.w700,
                                13,
                                cGrey_600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    spaceWidth(10),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jabatan Terakhir",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              jabatanTerakhir,
                              style: customTextStyle(
                                FontWeight.w700,
                                13,
                                cGrey_600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                spaceHeight(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Penonaktifan",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              tglPenonaktifan,
                              style: customTextStyle(
                                FontWeight.w700,
                                13,
                                cGrey_600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
