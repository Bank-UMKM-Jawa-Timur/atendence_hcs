import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

const focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(7)),
  borderSide: BorderSide(width: 1, color: cGrey_100),
);
const enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 1, color: cGrey_100),
);

decorationFormTgl() {
  return BoxDecoration(
    border: Border.all(color: cGrey_100),
    borderRadius: const BorderRadius.all(Radius.circular(4)),
  );
}
