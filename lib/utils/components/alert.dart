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

void showAlertDialogAndroid(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Alert',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      content: const Text('Proceed with destructive action?'),
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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cPrimary,
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}
