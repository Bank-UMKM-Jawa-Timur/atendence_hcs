import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/cabang_controller.dart';
import 'package:atendence_hcs/utils/components/list_bulan.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanDpp extends StatefulWidget {
  const LaporanDpp({super.key});

  @override
  State<LaporanDpp> createState() => _LaporanDppState();
}

class _LaporanDppState extends State<LaporanDpp> {
  ListBulan listBulan = Get.put(ListBulan());
  CabangController cabangC = Get.find<CabangController>();
  String? dropdownValueKat;
  String? dropdownValueKa;
  String? dropdownValueMonth;
  DateTime? valueYear;
  String? dropdownValueKantor;
  String? kdCabang;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Laporan Dpp"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            AnimatedSize(
              curve: Curves.linear,
              duration: const Duration(milliseconds: 300),
              child: Container(
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
                      formSelectKategori(),
                      isActive
                          ? Container()
                          : Column(
                              children: [
                                dropdownValueKat == "Rekap Kantor Cabang"
                                    ? formSelectKantor()
                                    : Container(),
                                dropdownValueKat == "Rekap Kantor Cabang"
                                    ? dropdownValueKantor == "Cabang"
                                        ? cabangC.isLoading.value
                                            ? loadingPage()
                                            : formSelectCabang()
                                        : Container()
                                    : Container(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, bottom: 5),
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
                                                    FontWeight.w500,
                                                    17,
                                                    cPrimary),
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
                                                    });
                                                    Get.back();
                                                  },
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  DateTime.now()
                                                      .year
                                                      .toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: cGrey_900),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                formSelectMonth(),
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: cPrimary,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            spaceHeight(10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
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
                    "Silahkan Filter untuk menampilkan data\nLaporan DPP.",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget formSelectKategori() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHeight(6),
        InkWell(
          onTap: () => setState(() {
            isActive = !isActive;
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kategori",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: cPrimary_500,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    isActive ? "Show Menu" : "Hide Menu",
                    style: customTextStyle(
                      FontWeight.w500,
                      10,
                      Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: Get.width,
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: DropdownButtonFormField<String>(
              hint: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Pilih Kategori",
                ),
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
                  // historiSpC.kategori.value = newValue;
                });
              },
              items: <String>['Rekap Keseluruhan', 'Rekap Kantor Cabang']
                  .map<DropdownMenuItem<String>>((String values) {
                return DropdownMenuItem<String>(
                  value: values,
                  child: Text(
                    values,
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
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
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
                if (dropdownValueKantor == "Cabang") {
                  cabangC.cabangM?.data.clear();
                  cabangC.getCabang();
                }
              },
              items: <String>['Pusat', 'Cabang']
                  .map<DropdownMenuItem<String>>((String value) {
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
        ),
      ],
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
          height: 65,
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
