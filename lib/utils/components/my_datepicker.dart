import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DateTime?> datePicker(BuildContext context, DateTime dateTime) =>
    showDatePicker(
      context: context,
      initialDate: dateTime,
      // firstDate: DateTime.now().subtract(const Duration(days: 14)),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              background: Colors.white,
              primary: cPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

Future<DateTime?> yearPickerOnly(BuildContext context, DateTime dateTime) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Pilih Tahun",
            style: customTextStyle(FontWeight.w500, 17, cPrimary),
          ),
          surfaceTintColor: Colors.white,
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(2023),
              lastDate: DateTime.now(),
              selectedDate: dateTime,
              initialDate: DateTime.now(),
              onChanged: (value) {
                // dateTime = valueDate;
                Get.back();
              },
            ),
          ),
        );
      },
    );
