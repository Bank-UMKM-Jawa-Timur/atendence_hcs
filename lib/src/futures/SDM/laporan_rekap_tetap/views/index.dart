import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/cabang_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/list_bulan.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanRekapTetap extends StatefulWidget {
  const LaporanRekapTetap({super.key});

  @override
  State<LaporanRekapTetap> createState() => _LaporanRekapTetapState();
}

class _LaporanRekapTetapState extends State<LaporanRekapTetap> {
  ListBulan listBulan = Get.put(ListBulan());
  CabangController cabangC = Get.find<CabangController>();
  DateTime? valueYear;
  String? dropdownValueMonth;
  String? dropdownValueKat;
  String? dropdownValueKantor;
  String? kdCabang;

  @override
  void initState() {
    cabangC.getCabang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Laporan Rekap Tetap"),
      backgroundColor: cGrey_200,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
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
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Text(
                                            "Pilih Tahun",
                                            style: customTextStyle(
                                                FontWeight.w500, 17, cPrimary),
                                          ),
                                          surfaceTintColor: Colors.white,
                                          content: SizedBox(
                                            width: 300,
                                            height: 300,
                                            child: YearPicker(
                                              firstDate: DateTime(2023),
                                              lastDate: DateTime.now(),
                                              selectedDate: valueYear,
                                              initialDate: DateTime.now(),
                                              onChanged: (value) {
                                                setState(() {
                                                  valueYear = value;
                                                  // jamsostekC.tahun.value =
                                                  //     value.getYear();
                                                });
                                                Get.back();
                                              },
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tahun",
                                      style: customTextStyle(
                                        FontWeight.w600,
                                        12,
                                        cGrey_700,
                                      ),
                                    ),
                                    spaceHeight(5),
                                    Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: cGrey_700),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 10),
                                        child: Text(
                                          valueYear?.year.toString() ??
                                              DateTime.now().year.toString(),
                                          style: const TextStyle(
                                              fontSize: 16, color: cGrey_900),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          spaceWidth(10),
                          Expanded(
                            flex: 1,
                            child: formSelectMonth(),
                          ),
                        ],
                      ),
                      spaceHeight(5),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: formSelectKategori(),
                          ),
                          spaceWidth(10),
                          Expanded(
                            flex: 1,
                            child: formSelectKantor(),
                          ),
                        ],
                      ),
                      spaceHeight(5),
                      cabangC.isLoading.value
                          ? loadingPage()
                          : formSelectCabang(),
                      spaceHeight(5),
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
                            // if (dropdownValueKat == null) {
                            //   snackbarfailed(
                            //       "Kategori harap dipilih!");
                            // } else {
                            //   if (dropdownValueMonth == null) {
                            //     snackbarfailed(
                            //         "Bulan harap dipilih!");
                            //   } else {
                            //     if (dropdownValueKat ==
                            //         "Rekap Keseluruhan") {
                            //       fetchKeseluruhan();
                            //     } else {
                            //       if (dropdownValueKantor != null) {
                            //         if (dropdownValueKantor ==
                            //             "Cabang") {
                            //           if (kdCabang == null) {
                            //             snackbarfailed(
                            //                 "Cabang harap dipilih!");
                            //           } else {
                            //             fetchKantor();
                            //           }
                            //         } else {
                            //           fetchKantor();
                            //         }
                            //       } else {
                            //         snackbarfailed(
                            //             "Kantor harap dipilih!");
                            //       }
                            //     }
                            //   }
                            // }
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
                      ),
                      spaceHeight(5),
                    ],
                  ),
                ),
              ),
              spaceHeight(10),
              cardItems(),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Container(
              //       width: Get.width,
              //       height: Get.height / 2,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: cGrey_400, width: 1),
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(6),
              //         ),
              //       ),
              //       child: emptyDataSetTitle(
              //         "Silahkan Filter untuk menampilkan data\nLaporan Rekap Tetap.",
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardItems() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteNames.detailLaporanRekapTetap);
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: cGrey_400),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: cPrimary_300,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  1.toString(),
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
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shortenLastName("nama"),
                                    style: customTextStyle(
                                      FontWeight.w700,
                                      14,
                                      Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "nip",
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
                  ],
                ),
                spaceHeight(10),
                Container(
                  width: Get.width,
                  height: 1,
                  color: cGrey_400,
                ),
                spaceHeight(10),
                spaceHeight(10),
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
                              "NPWP",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              "641310503644000",
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
                    spaceWidth(5),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PTKP",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              "K/1",
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
                    spaceWidth(5),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gaji",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              "5.593.423",
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
                  ],
                ),
                spaceHeight(5)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formSelectMonth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bulan",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            )),
        spaceHeight(4),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: DropdownButtonFormField<String>(
              hint: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Pilih Bulan"),
              ),
              isDense: true,
              isExpanded: true,
              value: dropdownValueMonth,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                focusedBorder: focusedBorder,
                enabledBorder: enabledBorder,
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueMonth = newValue!;
                  // jamsostekC.bulan.value = newValue;
                });
              },
              items: listBulan.bulan.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value['type'],
                  child: Text(
                    value['nama'],
                    style: customTextStyle(
                      FontWeight.w500,
                      15,
                      cGrey_900,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget formSelectKategori() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kategori",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            )),
        spaceHeight(4),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: DropdownButtonFormField<String>(
              hint: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Pilih Kategori"),
              ),
              isDense: true,
              isExpanded: true,
              value: dropdownValueKat,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                focusedBorder: focusedBorder,
                enabledBorder: enabledBorder,
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueKat = newValue!;
                });
              },
              items: ['Ebupot', 'Full Bulan']
                  .map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: customTextStyle(
                      FontWeight.w500,
                      15,
                      cGrey_900,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget formSelectKantor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kantor",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            )),
        spaceHeight(4),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: DropdownButtonFormField<String>(
              hint: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Pilih Kantor"),
              ),
              isDense: true,
              isExpanded: true,
              value: dropdownValueKantor,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                focusedBorder: focusedBorder,
                enabledBorder: enabledBorder,
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueKantor = newValue!;
                });
              },
              items: ['Pusat', 'Cabang'].map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: customTextStyle(
                      FontWeight.w500,
                      15,
                      cGrey_900,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget formSelectCabang() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cabang",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            ),
          ),
          spaceHeight(4),
          DropdownButtonFormField<String>(
            hint: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Pilih Cabang"),
            ),
            isDense: true,
            isExpanded: true,
            value: kdCabang,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (String? newValue) {
              setState(() {
                kdCabang = newValue!;
              });
            },
            items: cabangC.cabangM?.data.map<DropdownMenuItem<String>>((item) {
              return DropdownMenuItem<String>(
                value: item.kdCabang,
                child: Text(
                  "${item.kdCabang} - ${item.namaCabang}",
                  style: customTextStyle(
                    FontWeight.w500,
                    15,
                    cGrey_900,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
