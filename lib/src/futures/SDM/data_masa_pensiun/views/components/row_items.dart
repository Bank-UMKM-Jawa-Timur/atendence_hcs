import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

Padding row1() {
  return Padding(
    padding: const EdgeInsets.only(
      right: 20,
      left: 20,
      top: 10,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jabatan:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "Staf Analisa",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kantor:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "Pusat",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gol:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "-",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding row2() {
  return Padding(
    padding: const EdgeInsets.only(
      right: 20,
      left: 20,
      top: 10,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tgl Lahir:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "22 Feb 2000",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Umur",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "23",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Jenis Kelamin",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "Perempuan",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding row3() {
  return Padding(
    padding: const EdgeInsets.only(
      right: 20,
      left: 20,
      top: 10,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Status:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "K/O",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SK Angkat:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "016A/KEP/DIR.Um/2002",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tgl Angkat:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "02 Jan 2020",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding row4() {
  return Padding(
    padding: const EdgeInsets.only(
      right: 20,
      left: 20,
      top: 10,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masa Kerja:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "0,2",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pendidikan Terakhir:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "S2",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status:",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                "Belum Sampai Batas Pensiun",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
