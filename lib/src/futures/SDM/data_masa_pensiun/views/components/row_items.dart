import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

Padding row1(jabatan, kantor, gol) {
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
                jabatan,
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
                kantor,
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
                gol,
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

Padding row2(tglLahir, umur, jk) {
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
                tglLahir,
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
                umur,
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
                jk,
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

Padding row3(status, skAngkat, tglAngkat) {
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
                status,
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
                skAngkat,
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
                tglAngkat,
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

Padding row4(masaKerja, pendidikanTerakhir, status2) {
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
                masaKerja,
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
                pendidikanTerakhir,
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
                status2,
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
