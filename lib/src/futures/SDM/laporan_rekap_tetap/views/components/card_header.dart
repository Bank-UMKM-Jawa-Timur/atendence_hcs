import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

Widget cardHeader(String nip, nama, npwp, gaji) {
  return SizedBox(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nip",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                Text(
                  nip,
                  style: customTextStyle(
                    FontWeight.w700,
                    12,
                    Colors.black,
                  ),
                ),
              ],
            ),
            spaceHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nama Karyawan",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                Text(
                  nama,
                  style: customTextStyle(
                    FontWeight.w700,
                    12,
                    Colors.black,
                  ),
                ),
              ],
            ),
            spaceHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "NPWP",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                Text(
                  npwp,
                  style: customTextStyle(
                    FontWeight.w700,
                    12,
                    Colors.black,
                  ),
                ),
              ],
            ),
            spaceHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gaji",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                Text(
                  FormatCurrency.convertToIdr(gaji, 0),
                  style: customTextStyle(
                    FontWeight.w700,
                    12,
                    Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
