import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dataGaji() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Text("DATA KERJA"),
        ),
      ),
    ),
  );
}
