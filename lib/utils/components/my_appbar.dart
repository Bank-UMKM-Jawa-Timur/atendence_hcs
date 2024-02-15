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
    backgroundColor: cPrimary,
    elevation: 0,
    foregroundColor: Colors.white,
  );
}
