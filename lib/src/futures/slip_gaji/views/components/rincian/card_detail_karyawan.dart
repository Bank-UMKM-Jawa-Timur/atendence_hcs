import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

Widget cardDetailKarywan(
  String nip,
  nama,
  norek,
  jabatan,
  tglGabung,
  lamaKerja,
) {
  return SizedBox(
    child: Container(
      decoration: BoxDecoration(
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
                  "No Rekening",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                Text(
                  norek,
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
                  "Jabatan",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    jabatan,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: customTextStyle(
                      FontWeight.w700,
                      12,
                      Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            spaceHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tanggal Bergabung",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                Text(
                  // "05 Juli 2011",
                  tglGabung,
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
                  "Lama Kerja",
                  style: customTextStyle(
                    FontWeight.w600,
                    12,
                    cGrey_700,
                  ),
                ),
                Text(
                  // "12 Tahun, 6 Bulan",
                  lamaKerja,
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
