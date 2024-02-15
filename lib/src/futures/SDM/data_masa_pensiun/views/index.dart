import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/list_masa_pensiun_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataMasaPensiunPage extends StatefulWidget {
  DataMasaPensiunPage({super.key});

  @override
  State<DataMasaPensiunPage> createState() => _DataMasaPensiunPageState();
}

class _DataMasaPensiunPageState extends State<DataMasaPensiunPage> {
  // ListMasaPensiunController listC = Get.find<ListMasaPensiunController>();

  List row1 = [
    {'title': "Jabatan:", 'value': 'Kepala Seksi'},
    {'title': "Kantor:", 'value': 'Pusat'},
    {'title': "Gol:", 'value': '-'},
  ];

  List row2 = [
    {'title': "Tgl Lahir:", 'value': '19 Feb 1999'},
    {'title': "Umur:", 'value': '25'},
    {'title': "JK:", 'value': 'Perempuan'},
  ];

  List row3 = [
    {'title': "Status:", 'value': 'K/O'},
    {'title': "Sk Angkat:", 'value': '016A/KEP/DIR.Um/2002'},
    {'title': "Tgl Angkat:", 'value': '02 Jan 2002'},
  ];

  List row4 = [
    {'title': "Masa Kerja:", 'value': '0,1'},
    {'title': "Pendidikan Terakhir:", 'value': 'S2'},
  ];

  List row5 = [
    {'title': "Status:", 'value': 'Sudah melebihi batas pansiun'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Data Masa Pensiun"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          width: Get.width,
          height: Get.height,
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
                    Padding(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          height: 1,
                          color: cGrey_300,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: SizedBox(
                            width: Get.width,
                            child: Row(
                              children: [
                                ListView.builder(
                                  itemCount: row1.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var w = Get.width;
                                    return SizedBox(
                                      width: w / row1.length,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            row1[index]['title'],
                                            style: customTextStyle(
                                              FontWeight.w700,
                                              11,
                                              Colors.black,
                                            ),
                                          ),
                                          Text(
                                            row1[index]['value'],
                                            style: customTextStyle(
                                              FontWeight.w600,
                                              12,
                                              cGrey_700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
