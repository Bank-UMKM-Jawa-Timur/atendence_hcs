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
      border: Border.all(color: cGrey_400, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    child: Column(
      children: [
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
            color: cPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              "Data Diri",
              style: customTextStyle(FontWeight.w700, 15, Colors.white),
            ),
          ),
        ),
        Container(
          width: Get.width,
          height: 1,
          color: cGrey_400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: customTextStyle(
                              FontWeight.w600, 14, Colors.black),
                        ),
                        spaceHeight(5),
                        Text(
                          jabatan,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              customTextStyle(FontWeight.w600, 12, cGrey_700),
                        ),
                      ],
                    ),
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
                  height: 1,
                  color: cGrey_400,
                ),
              ),
              Text(
                "Slip Gaji Tahun $tahun",
                style: customTextStyle(FontWeight.w600, 12, cGrey_700),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
