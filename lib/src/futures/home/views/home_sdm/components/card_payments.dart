import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cardPayment() {
  return Container(
    width: Get.width,
    height: 150,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(17),
      ),
      image: DecorationImage(
        image: AssetImage('assets/images/card.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Perkiraan Gaji Bulan Ini",
                style: customTextStyle(
                  FontWeight.w700,
                  14,
                  Colors.white,
                ),
              ),
              const Icon(
                CommunityMaterialIcons.wallet_outline,
                size: 30,
                color: Colors.white,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: customTextStyle(
                  FontWeight.w700,
                  13,
                  cPrimary_300,
                ),
              ),
              Text(
                "Rp 450,000,000",
                style: customTextStyle(
                  FontWeight.w800,
                  24,
                  Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
