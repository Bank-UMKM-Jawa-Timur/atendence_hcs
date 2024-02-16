import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/views/components/row_items.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_button.dart';
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
  // ListMasaPensiunController listC = Get.find<ListMasaPensiunController>();

  String? valueKat;
  List kategori = [
    {'name': 'Keseluruhan'},
    {'name': 'Divisi'},
    {'name': 'Sub Divisi'},
    {'name': 'Bagian'},
    {'name': 'Kantor'},
  ];
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Data Masa Pensiun"),
      body: Padding(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        dropdownKategori(),
                        dropdownKategori(),
                        dropdownKategori(),
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
                  )
                ],
              ),
            ),
            spaceHeight(10),
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
                  Container(
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
                                          shortTwoCaracterName(
                                              "Mursida Lestari"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                  ),
                ],
              ),
            ),
          ],
        ),
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
}
