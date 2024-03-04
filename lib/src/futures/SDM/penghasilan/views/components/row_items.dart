import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

Padding row1(gajiPokok, tKeluarga, tTeleponListrikDanAir) {
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
                "Gaji Pokok :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                gajiPokok,
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
                "T. Keluarga :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tKeluarga,
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
                "T. Tlp,Listrik & Air :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tTeleponListrikDanAir,
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

Padding row2(tJabatan, tKhusus, tPerumahan) {
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
                "T. Jabatan :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tJabatan,
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
                "T. Khusus :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tKhusus,
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
                "T. Perumahan :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tPerumahan,
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

Padding row3(tPelaksana, tKemahalan, tKesejahteraan) {
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
                "T. Pelaksana :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tPelaksana,
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
                "T. Kemahalan :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tKemahalan,
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
                "T. Kesejahteraan :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tKesejahteraan,
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

Padding row4(tTeller, tPenyesuaian, total) {
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
                "T. Teller :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tTeller,
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
                "T. Penyesuaian :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                tPenyesuaian,
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
                "Total :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                total,
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

Padding row5(pph21) {
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
                "PPH 21 :",
                style: customTextStyle(
                  FontWeight.w700,
                  11,
                  Colors.black,
                ),
              ),
              Text(
                pph21,
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
