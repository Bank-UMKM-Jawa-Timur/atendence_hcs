import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cardTeratur(uangMakan, pulsa, penggantiVitamin, transport, total) {
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
                    "Teratur",
                    style: textBoldDarkLarge,
                  ),
                ],
              ),
              spaceHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Uang Makan",
                    style: textGreyMedium,
                  ),
                  Text(
                    FormatCurrency.convertToIdr(uangMakan, 0),
                    style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                  ),
                ],
              ),
              spaceHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pulsa",
                    style: textGreyMedium,
                  ),
                  Text(
                    FormatCurrency.convertToIdr(pulsa, 0),
                    style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                  ),
                ],
              ),
              spaceHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pengganti Vitamin",
                    style: textGreyMedium,
                  ),
                  Text(
                    FormatCurrency.convertToIdr(penggantiVitamin, 0),
                    style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                  ),
                ],
              ),
              spaceHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Transport",
                    style: textGreyMedium,
                  ),
                  Text(
                    FormatCurrency.convertToIdr(transport, 0),
                    style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                  ),
                ],
              ),
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
                  "Total",
                  style: textBoldLightLarge,
                ),
                Text(
                  FormatCurrency.convertToIdr(total, 0),
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
