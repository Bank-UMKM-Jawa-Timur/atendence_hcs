import 'package:atendence_hcs/src/auth/controllers/login_controller.dart';
import 'package:atendence_hcs/utils/components/alert.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget logout(context) {
  return SizedBox(
    width: Get.width,
    height: 70,
    child: InkWell(
      highlightColor: Colors.white,
      onTap: () {
        if (GetPlatform.isAndroid) {
          showAlertDialogAndroid(
            context,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: cPrimary,
              ),
              onPressed: () {
                LoginController().logout();
              },
              child: const Text("Yes"),
            ),
            "Warning!",
            "Apakah Kamu ingin logout?",
          );
        } else if (GetPlatform.isIOS) {
          showAlertDialogIos(
            context,
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                LoginController().logout();
              },
              child: const Text('Yes'),
            ),
            "Warning!",
            "Apakah Kamu ingin logout?",
          );
        }
      },
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: cPrimary_300,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: const Icon(
              CommunityMaterialIcons.logout_variant,
              color: cPrimary,
              size: 21,
            ),
          ),
          spaceWidth(10),
          const Text(
            "Logout",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: cPrimary,
            ),
          ),
        ],
      ),
    ),
  );
}
