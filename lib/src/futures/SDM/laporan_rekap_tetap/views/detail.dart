import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_bonus.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_header.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_paja_insentif.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_teratur.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_tidak_teratur.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailLaporanRekapTetap extends StatelessWidget {
  const DetailLaporanRekapTetap({super.key});

  @override
  Widget build(BuildContext context) {
    var kantor = Get.arguments['kantor'];
    var kategori = Get.arguments['kategori'];
    var bulan = Get.arguments['bulan'];
    var tahun = Get.arguments['tahun'];
    print("$kantor $kategori $bulan $tahun");
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Detail Laporan Pergerakan Karir"),
      bottomNavigationBar: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: cPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "PPH21\n(PPH Bentukan - Pajak Insentif)",
                style: textBoldLightMedium,
              ),
              Text(
                FormatCurrency.convertToIdr(10000000, 0),
                style: customTextStyle(FontWeight.w700, 15, Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              spaceHeight(10),
              cardHeader("01474", "Arsyad Arthan N.", "01289381238713"),
              spaceHeight(10),
              cardTeratur(
                10000000,
                10000000,
                10000000,
                10000000,
                10000000,
              ),
              spaceHeight(10),
              cardTidakTeratur(
                1000000,
                1000000,
                1000000,
                1000000,
                1000000,
                1000000,
                1000000,
                1000000,
                10000000,
              ),
              spaceHeight(10),
              cardBonus(
                1000000,
                1000000,
                1000000,
                1000000,
                4000000,
              ),
              spaceHeight(10),
              penghasilBruto(10000000),
              spaceHeight(5),
              totalBruto(10000000),
              spaceHeight(5),
              pph21Bentukan(10000000),
              spaceHeight(10),
              cardPajakInsentif(1000000, 1000000, 2000000),
              spaceHeight(20),
            ],
          ),
        ),
      ),
    );
  }

  Container penghasilBruto(value) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Penambah Penghasil Bruto",
              style: textBoldDarkMedium,
            ),
            Text(
              FormatCurrency.convertToIdr(value, 0),
              style: customTextStyle(FontWeight.w700, 12, cGrey_700),
            ),
          ],
        ),
      ),
    );
  }

  Container totalBruto(value) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total Bruto",
              style: textBoldDarkMedium,
            ),
            Text(
              FormatCurrency.convertToIdr(value, 0),
              style: customTextStyle(FontWeight.w700, 12, cGrey_700),
            ),
          ],
        ),
      ),
    );
  }

  Container pph21Bentukan(value) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "PPH21 Bentukan",
              style: textBoldDarkMedium,
            ),
            Text(
              FormatCurrency.convertToIdr(value, 0),
              style: customTextStyle(FontWeight.w700, 12, cGrey_700),
            ),
          ],
        ),
      ),
    );
  }
}
