import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackbarfailed(var msg) {
  return Get.snackbar(
    "Gagal!",
    "message",
    backgroundColor: cGrey_300,
    duration: const Duration(seconds: 3),
    colorText: cRed_900,
    messageText: Text(
      msg,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}

snackbarSuccess(var msg) {
  return Get.snackbar(
    "Berhasil",
    "message",
    backgroundColor: cGrey_300,
    duration: const Duration(seconds: 3),
    colorText: cGreen_900,
    messageText: Text(
      msg,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}
