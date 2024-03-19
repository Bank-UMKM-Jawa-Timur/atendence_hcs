import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cardPotongan(
  jpBpjs,
  dpp,
  kreditKoperasi,
  iuranKoperasi,
  kreditPegawai,
  iuaranIk,
  totalPotongan,
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
                    "Potongan",
                    style: textBoldDarkMedium,
                  ),
                ],
              ),
              spaceHeight(10),
              jpBpjs > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "JP BPJS TK 1%",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(jpBpjs, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              dpp > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "DPP 5%",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(dpp, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              kreditKoperasi > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Kredit Koperasi",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(kreditKoperasi, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              iuranKoperasi > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Iuran Koperasi",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(iuranKoperasi, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              kreditPegawai > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Kredit Pegawai",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(kreditPegawai, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
                        spaceHeight(10),
                      ],
                    )
                  : Container(),
              iuaranIk > 0
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "IURAN IK",
                              style: textGreyMedium,
                            ),
                            Text(
                              FormatCurrency.convertToIdr(iuaranIk, 0),
                              style: customTextStyle(
                                  FontWeight.w700, 12, cGrey_700),
                            ),
                          ],
                        ),
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
                  "Total Potongan",
                  style: textBoldLightLarge,
                ),
                Text(
                  FormatCurrency.convertToIdr(totalPotongan, 0),
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
