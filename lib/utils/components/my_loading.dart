import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

loadingPage() {
  return const Center(
    child: SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        backgroundColor: cPrimary_300,
        color: cPrimary,
        strokeWidth: 5,
      ),
    ),
  );
}
