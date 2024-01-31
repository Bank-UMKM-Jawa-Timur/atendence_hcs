import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cardPersion(String nama, String jabatan, var tahun, var jk) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: cGrey_400, width: 2),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: textBoldDarkLarge,
                  ),
                  spaceHeight(5),
                  Text(
                    jabatan,
                    style: textBoldGreyMedium,
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      jk != "Perempuan"
                          ? 'assets/icon/male.jpg'
                          : 'assets/icon/female.jpg',
                    ),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: Get.width,
              height: 2,
              color: cGrey_400,
            ),
          ),
          Text(
            "Slip Gaji Tahun $tahun",
            style: textBoldGreyMedium,
          ),
        ],
      ),
    ),
  );
}
