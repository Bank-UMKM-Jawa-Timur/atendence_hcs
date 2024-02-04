import 'package:community_material_icon/community_material_icon.dart';

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

// Use Dismissible
void showAlertDialogIosDismiss(
  BuildContext context,
  String title,
  String msg,
  bool dismissible,
  void Function() aksiNo,
  void Function() aksiYes,
) {
  showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: dismissible,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            aksiNo;
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            aksiYes;
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}

void showAlertDialogAndroidDismiss(
  BuildContext context,
  String title,
  String msg,
  bool dismissible,
  void Function() aksiNo,
  void Function() aksiYes,
) {
  showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: dismissible,
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
            aksiNo;
            Get.back();
          },
          child: const Text("No"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cPrimary,
          ),
          onPressed: () {
            aksiYes;
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}

void alertSuccess(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => const CupertinoAlertDialog(
      title: Text(
        "Success",
        style: TextStyle(fontSize: 15),
      ),
      content: Icon(
        CommunityMaterialIcons.check_circle_outline,
        size: 50,
        color: cGreen_900,
      ),
    ),
  );
}
