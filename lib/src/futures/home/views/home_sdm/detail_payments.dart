import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_shadow.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPayments extends StatelessWidget {
  const DetailPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Detail Perkiraan Gaji"),
      bottomNavigationBar: Container(
        width: Get.width,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            shadowMedium,
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total :",
                style: customTextStyle(
                  FontWeight.w600,
                  16,
                  cGrey_900,
                ),
              ),
              Text(
                "Rp 16.000.000",
                style: customTextStyle(
                  FontWeight.w800,
                  17,
                  cPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: cGrey_400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: cPrimary,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: customTextStyle(
                                  FontWeight.w600, 16, Colors.white),
                            ),
                          ),
                        ),
                        spaceWidth(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pusat",
                              style: customTextStyle(
                                  FontWeight.w600, 16, Colors.black),
                            ),
                            Text(
                              "0000",
                              style: customTextStyle(
                                FontWeight.w500,
                                14,
                                cGrey_900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          CommunityMaterialIcons.currency_usd_circle_outline,
                          size: 23,
                          color: cGrey_700,
                        ),
                        Text(
                          "Rp 20.000.000",
                          style: customTextStyle(FontWeight.w700, 15, cPrimary),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
