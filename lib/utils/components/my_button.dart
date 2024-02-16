import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

buttonWithIcon(Icon icon, String text, String namRoute) {
  return Container(
    height: 40,
    decoration: const BoxDecoration(
      color: cPrimary,
      borderRadius: BorderRadius.all(
        Radius.circular(7),
      ),
    ),
    width: Get.width,
    child: ElevatedButton(
      onPressed: () {
        namRoute;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: cPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          spaceWidth(5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
