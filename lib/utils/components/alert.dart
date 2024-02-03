import '../components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAlertDialogIos(
  BuildContext context,
  CupertinoDialogAction aksi,
  String title,
  String msg,
) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        aksi,
      ],
    ),
  );
}

void showAlertDialogAndroid(
  BuildContext context,
  ElevatedButton logout,
  String title,
  String msg,
) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      content: Text(msg),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cGrey_500,
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text("No"),
        ),
        logout,
      ],
    ),
  );
}
