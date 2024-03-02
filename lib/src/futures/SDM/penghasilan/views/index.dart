import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProsesPenghasilan extends StatefulWidget {
  const ProsesPenghasilan({super.key});

  @override
  State<ProsesPenghasilan> createState() => _ProsesPenghasilanState();
}

class _ProsesPenghasilanState extends State<ProsesPenghasilan> {
  String valueKategori = "Proses";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Proses Penghasilan"),
      body: Padding(
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
                child: formSelectKantor(),
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
            //         "$valueKategori Penghasilan Masih Kosong.",
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget cardItems() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteNames.detailPenghasilan);
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
                                    "Kategori",
                                    style: customTextStyle(
                                      FontWeight.w700,
                                      14,
                                      Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Januari 2024 | 25-01-2024",
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
                    Row(
                      children: [
                        Text(
                          "Detail",
                          style: customTextStyle(
                            FontWeight.w500,
                            13,
                            cGrey_700,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: cGrey_700,
                        )
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteNames.rincianPenghasilan);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.amber,
                          ),
                          child: const Text(
                            "Rincian",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    spaceWidth(5),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: cGreen_900,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteNames.payrollPenghasilan);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: cGreen_900,
                          ),
                          child: const Text(
                            "Payroll",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
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

  Widget formSelectKantor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Status",
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
              hint: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(valueKategori),
              ),
              isDense: true,
              isExpanded: true,
              value: valueKategori,
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
                  valueKategori = newValue!;
                });
              },
              items: ['Proses', 'Final'].map<DropdownMenuItem<String>>((value) {
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
}
