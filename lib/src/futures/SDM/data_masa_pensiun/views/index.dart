import 'package:atendence_hcs/http/models/SDM/masa_pensiun/divisi_model.dart'
    as diviModel;
import 'package:atendence_hcs/http/models/SDM/masa_pensiun/sub_divisi_model.dart'
    as subDivisModel;
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/bagian_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/divisi_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/list_masa_pensiun_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/sub_divis_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/views/components/row_items.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_button.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_short_two_caracter_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataMasaPensiunPage extends StatefulWidget {
  const DataMasaPensiunPage({super.key});

  @override
  State<DataMasaPensiunPage> createState() => _DataMasaPensiunPageState();
}

class _DataMasaPensiunPageState extends State<DataMasaPensiunPage> {
  DivisiController divisC = Get.find<DivisiController>();
  SubDivisiController subDivisiC = Get.find<SubDivisiController>();
  BagianController bagianC = Get.find<BagianController>();
  ListMasaPensiunController listMasaPensiunC =
      Get.find<ListMasaPensiunController>();

  String? valueKat;
  String? valueDivisi;
  String? valueSubDivisi;
  String? valueBagian;
  String? valueKantor;

  List kategori = [
    {'name': 'Keseluruhan'},
    {'name': 'Divisi'},
    {'name': 'Sub Divisi'},
    {'name': 'Bagian'},
    {'name': 'Kantor'},
  ];
  bool isActive = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Data Masa Pensiun"),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                width: Get.width,
                // height: Get.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: cGrey_400, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Column(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            dropdownKategori(),
                            // show dropDown Divis
                            listMasaPensiunC.showDiv.value
                                ? divisC.isLoading.value
                                    ? loadingPage()
                                    : dropdownDivisi(divisC.divisiM!.data)
                                : Container(),

                            // show dropDown Sub Divis
                            subDivisiC.emptyData.value
                                ? Container()
                                : listMasaPensiunC.showSubDiv.value
                                    ? subDivisiC.isLoading.value
                                        ? loadingPage()
                                        : dropdownSubDivisi()
                                    : Container(),

                            // show dropDown Bagian
                            bagianC.emptyData.value
                                ? Container()
                                : listMasaPensiunC.bagian.value
                                    ? bagianC.isLoading.value
                                        ? loadingPage()
                                        : dropdownBagian(bagianC.bagianM!.data)
                                    : Container(),

                            // Button filter
                            buttonWithIcon(
                              const Icon(
                                CommunityMaterialIcons.filter_outline,
                                color: Colors.white,
                                size: 20,
                              ),
                              "Tampilkan",
                              "namRoute",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              spaceHeight(10),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: cGrey_400, width: 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: emptyDataSetTitle(
                        "Pilih Kategori untuk menampilkan data."),
                  ),
                ],
              )
              // Container(
              //   width: Get.width,
              //   // height: Get.height,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(color: cGrey_400, width: 1),
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(6),
              //     ),
              //   ),
              //   child: cardData(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Padding dropdownSubDivisi() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sub Divisi",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            // value: skemaKreditController.valueSkemaKredit,
            value: valueSubDivisi,
            hint: Text(
              valueSubDivisi ?? "-- pilih Sub Divisi --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueSubDivisi = value;
                  if (listMasaPensiunC.bagian.value) {
                    bagianC.getBagian(valueSubDivisi);
                  }
                  if (valueBagian != null) {
                    bagianC.bagianM!.data.clear();
                    valueBagian = null;
                  }
                });
              }
            }),
            items: subDivisiC.subdivisiM?.data
                .map<DropdownMenuItem<String>>((item) {
              return DropdownMenuItem(
                child: Text(
                  item.kdSubdiv + " - " + item.namaSubdivisi,
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item.kdSubdiv,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Container cardData() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: cGrey_300, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isActive = !isActive;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: cPrimary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            shortTwoCaracterName("Mursida Lestari"),
                            style: customTextStyle(
                              FontWeight.w700,
                              10,
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                      spaceWidth(7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MURSIDA LIESWARI",
                            style: customTextStyle(
                              FontWeight.w700,
                              11,
                              Colors.black,
                            ),
                          ),
                          Text(
                            "01287",
                            style: customTextStyle(
                              FontWeight.w600,
                              10,
                              cGrey_600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: cGrey_600,
                  )
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.linear,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: 1,
                  color: cGrey_300,
                ),
                isActive
                    ? Column(
                        children: [
                          spaceHeight(10),
                          row1(),
                          row2(),
                          row3(),
                          row4(),
                          spaceHeight(20),
                        ],
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding dropdownKategori() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kategori",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            // value: skemaKreditController.valueSkemaKredit,
            value: valueKat,
            hint: Text(
              "-- pilih Kategori --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueKat = value as String?;
                  listMasaPensiunC.kategori.value = value as String;
                  listMasaPensiunC.changeValDropdown();
                  if (listMasaPensiunC.showDiv.value) {
                    divisC.getDivisi();
                  }
                });
              }
            }),
            items: kategori.map((item) {
              return DropdownMenuItem(
                child: Text(
                  item['name'],
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item['name'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Padding dropdownDivisi(List<diviModel.Datum> data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Divisi",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            // value: skemaKreditController.valueSkemaKredit,
            value: valueDivisi,
            hint: Text(
              valueDivisi ?? "-- pilih Divisi --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueDivisi = value;
                  if (listMasaPensiunC.showSubDiv.value) {
                    subDivisiC.getSubDivisi(valueDivisi);
                  }
                  if (valueSubDivisi != null) {
                    subDivisiC.subdivisiM!.data.clear();
                    valueSubDivisi = null;
                  }
                  if (valueKat == "Bagian") {
                    if (valueBagian != null) {
                      bagianC.bagianM!.data.clear();
                      valueBagian == null;
                    }
                  }
                });
              }
            }),
            items: data.map((item) {
              return DropdownMenuItem(
                child: Text(
                  item.kdDivisi + " - " + item.namaDivisi,
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item.kdDivisi,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Padding dropdownBagian(List<dynamic> data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bagian",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            value: valueBagian,
            hint: Text(
              "-- pilih Bagian --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueBagian = value;
                });
              }
            }),
            items: bagianC.bagianM?.data.map((item) {
              return DropdownMenuItem(
                child: Text(
                  item.kdBagian + " - " + item.namaBagian,
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item.kdBagian,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
