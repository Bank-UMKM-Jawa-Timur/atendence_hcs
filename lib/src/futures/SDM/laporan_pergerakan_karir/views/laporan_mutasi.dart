import 'package:atendence_hcs/src/futures/SDM/laporan_pergerakan_karir/controllers/laporan_mutasi_controller.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/my_datepicker.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanMutasi extends StatefulWidget {
  const LaporanMutasi({super.key});

  @override
  State<LaporanMutasi> createState() => _LaporanMutasiState();
}

class _LaporanMutasiState extends State<LaporanMutasi> {
  LaporanMutasiController laporanMutasiC = Get.find<LaporanMutasiController>();
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  DateTime year = DateTime.now();
  final controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
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
    laporanMutasiC.getLaporanMutasi(
      firstDate.simpleDate(),
      lastDate.simpleDate(),
      page,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cGrey_200,
        appBar: appBarPrimary("Laporan Mutasi"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(7),
                ),
                border: Border.all(color: cGrey_400, width: 1),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(children: [
                    formFirstDate(context),
                    spaceHeight(15),
                    formLastDate(context),
                    spaceHeight(15),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: cPrimary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            page = 1;
                          });
                          laporanMutasiC.laporanMutasiM!.data.clear();
                          laporanMutasiC.getLaporanMutasi(
                              firstDate.simpleDate(),
                              lastDate.simpleDate(),
                              page);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cPrimary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CommunityMaterialIcons.filter_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                            spaceWidth(5),
                            const Text(
                              "Tampilkan",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ])),
            ),
            spaceHeight(10),
            Obx(
              () => page == 1
                  ? laporanMutasiC.isLoading.value
                      ? loadingPage()
                      : laporanMutasiC.isEmptyData.value
                          ? Container(
                              width: Get.width,
                              height: Get.height / 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: cGrey_400, width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                              child: emptyDataSetTitle(
                                laporanMutasiC.isFilter.value
                                    ? "Data yang anda filter masih kosong!."
                                    : "Silahkan Filter untuk menampilkan data\nLaporan Mutasi.",
                              ),
                            )
                          : listData()
                  : listData(),
            )
          ]),
        ));
  }

  Expanded listData() {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: laporanMutasiC.laporanMutasiM!.data.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var data = laporanMutasiC.laporanMutasiM?.data;
          if (index < laporanMutasiC.laporanMutasiM!.data.length) {
            return cardItems(
              index + 1,
              data?[index].nip,
              data?[index].namaKaryawan,
              data?[index].tanggalPengesahan,
              data?[index].buktiSk,
              data?[index].jabatanLama,
              data?[index].jabatanBaru,
              data?[index].kantorLama,
              data?[index].kantorBaru,
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: !laporanMutasiC.isEmptyData.value
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

  Column formFirstDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHeight(7),
        Text(
          "Dari",
          style: customTextStyle(
            FontWeight.w600,
            12,
            cGrey_900,
          ),
        ),
        spaceHeight(4),
        InkWell(
          onTap: () async {
            if (GetPlatform.isAndroid) {
              final date = await datePicker(context, DateTime.now());
              if (mounted) {
                setState(() {
                  firstDate = date ?? DateTime.now();
                });
              }
            } else if (GetPlatform.isIOS) {
              showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                  height: 400,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            maximumYear: DateTime.now().year,
                            minimumYear: 2023,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (val) {
                              setState(() {
                                firstDate = val;
                              });
                            }),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          child: Container(
            width: Get.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_600, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(firstDate.simpleDate().toString()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column formLastDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHeight(7),
        Text(
          "Sampai",
          style: customTextStyle(
            FontWeight.w600,
            12,
            cGrey_900,
          ),
        ),
        spaceHeight(4),
        InkWell(
          onTap: () async {
            if (GetPlatform.isAndroid) {
              final date = await datePicker(context, DateTime.now());
              if (mounted) {
                setState(() {
                  lastDate = date ?? DateTime.now();
                });
              }
            } else if (GetPlatform.isIOS) {
              showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                  height: 400,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            maximumYear: DateTime.now().year,
                            minimumYear: 2023,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (val) {
                              setState(() {
                                lastDate = val;
                              });
                            }),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          child: Container(
            width: Get.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_600, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(lastDate.simpleDate().toString()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding cardItems(
    int no,
    nip,
    nama,
    tglMutasi,
    buktiSK,
    jabatanLama,
    jabatanBaru,
    kantorLama,
    kantorBaru,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
              Radius.circular(7),
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
                              "Tanggal Mutasi",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              tglMutasi,
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
                              "Bukti SK",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              buktiSK,
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
                              "Jabatan Lama",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              jabatanLama,
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
                              "Jabatan Baru",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              jabatanBaru,
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
                              "Kantor Lama",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              kantorLama,
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
                              "Kantor Baru",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              kantorBaru,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
