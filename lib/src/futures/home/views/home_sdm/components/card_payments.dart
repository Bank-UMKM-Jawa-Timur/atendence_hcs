import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget cardPayment(String value) {
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: customTextStyle(
                      FontWeight.w600,
                      15,
                      cPrimary_300,
                    ),
                  ),
                  Text(
                    "Rp $value",
                    style: customTextStyle(
                      FontWeight.w800,
                      24,
                      Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteNames.detailPayements);
                    },
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Center(
                          child: Text(
                            "Detail",
                            style: customTextStyle(
                                FontWeight.w500, 12, Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceHeight(5),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget shimmerCardPayment() {
  return Shimmer.fromColors(
    baseColor: cGrey_200,
    highlightColor: cPrimary_300,
    child: Container(
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
    ),
  );
}
