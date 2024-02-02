import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cardPendapatan(
  int tjKeluarga,
  tjJabatan,
  gjPenyesuaian,
  tjPerumahan,
  tjTelepon,
  tjPelaksana,
  tjKemahalan,
  tjKesejahteraan,
  tjTeller,
  tjKusus,
  gjPokok,
  totalPendapatan,
) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: cGrey_400, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pendapatan",
                    style: textBoldDarkMedium,
                  ),
                ],
              ),
              spaceHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Gaji Pokok",
                    style: textGreyMedium,
                  ),
                  Text(
                    FormatCurrency.convertToIdr(gjPokok, 0),
                    style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                  ),
                ],
              ),
              spaceHeight(10),
              tjKeluarga > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Keluarga",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjKeluarga, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjJabatan > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Jabatan",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjJabatan, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              gjPenyesuaian > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Gaji Penyesuaian",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(gjPenyesuaian, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjPerumahan > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Perumahan",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjPerumahan, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjTelepon > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Telepon",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjTelepon, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjPelaksana > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Pelaksana",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjPelaksana, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjKemahalan > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Kemahalan",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjKemahalan, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjKesejahteraan > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Kesejahteraan",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjKesejahteraan, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjTeller > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Teller",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjTeller, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              tjKusus > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tj. Kusus",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(tjKusus, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
        // Container(width: Get.width, height: 2, color: cGrey_400),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
            color: cPrimary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Pendapatan",
                  style: textBoldLightLarge,
                ),
                Text(
                  FormatCurrency.convertToIdr(totalPendapatan, 0),
                  style: textBoldLightLarge,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
