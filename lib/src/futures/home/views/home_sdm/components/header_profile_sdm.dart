import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget headerHomeSdm(String jk, String nama, String jabatan) {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          hoverColor: cGrey_200,
          highlightColor: cPrimary,
          onTap: () {
            Get.toNamed(RouteNames.profile);
          },
          child: Row(
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      jk != "Laki-laki"
                          ? 'assets/icon/female.jpg'
                          : 'assets/icon/male.jpg',
                    ),
                  ),
                ),
              ),
              spaceWidth(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shortenLastName(nama),
                    style: customTextStyle(
                      FontWeight.w700,
                      17,
                      Colors.white,
                    ),
                  ),
                  spaceHeight(5),
                  Text(
                    jabatan,
                    style: customTextStyle(
                      FontWeight.w500,
                      14,
                      cGrey_100,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const Icon(
          Icons.notifications_none,
          size: 30,
          color: Colors.white,
        )
      ],
    ),
  );
}
