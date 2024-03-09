import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

appBarPrimary(title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: true,
    backgroundColor: cPrimary,
    elevation: 0,
    foregroundColor: Colors.white,
  );
}

appBarPrimaryCustom(title, Color colorTitle, bool ceneterTitle, Color bgColor) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: colorTitle,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: ceneterTitle,
    backgroundColor: bgColor,
    elevation: 0,
    foregroundColor: colorTitle,
  );
}
