import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List dataGajiList = [
  "Gaji Pokok",
  "Gaji Penyesuian",
  "Kemahalan",
  "Kesejahteraan",
  "Pelaksana",
  "TI",
];

Widget dataGaji() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dataGajiList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Data Gaji",
                          style:
                              customTextStyle(FontWeight.w500, 15, cGrey_900),
                        ),
                      )
                    else if (index == 2)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("Data Tunjangan",
                            style: customTextStyle(
                                FontWeight.w500, 15, cGrey_900)),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: cGrey_400,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${dataGajiList[index]} :",
                              style: const TextStyle(
                                fontSize: 13,
                                color: cGrey_700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            spaceHeight(7),
                            Text(
                              '-',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index == dataGajiList.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Gaji :",
                              style: customTextStyle(
                                  FontWeight.w500, 15, cGrey_900),
                            ),
                            spaceHeight(5),
                            Text(
                              "Rp 3.800.000",
                              style:
                                  customTextStyle(FontWeight.w600, 15, cBlack),
                            ),
                          ],
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ),
  );
}
