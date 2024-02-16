import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

Column emptyData(String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      spaceHeight(60),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Image(
          image: AssetImage('assets/images/empty_data.png'),
        ),
      ),
      Text(
        "Silahkan cari data karyawan untuk\nmenampilkan data $title",
        textAlign: TextAlign.center,
        style: customTextStyle(FontWeight.w500, 15, Colors.black),
      )
    ],
  );
}
