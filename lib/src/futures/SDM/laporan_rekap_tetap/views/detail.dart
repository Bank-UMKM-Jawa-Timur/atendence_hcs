import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/controllers/detail_rekap_tetap_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_bonus.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_header.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_paja_insentif.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_teratur.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_rekap_tetap/views/components/card_tidak_teratur.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailLaporanRekapTetap extends StatelessWidget {
  const DetailLaporanRekapTetap({super.key});

  @override
  Widget build(BuildContext context) {
    var nip = Get.arguments['nip'];
    var kantor = Get.arguments['kantor'];
    var kategori = Get.arguments['kategori'];
    var bulan = Get.arguments['bulan'];
    var tahun = Get.arguments['tahun'];
    return GetX<DetailRekapTetapController>(
      init: DetailRekapTetapController(),
      initState: (s) {
        s.controller!.getRekapTetap(nip, tahun, bulan, kategori, kantor);
      },
      builder: (c) => Scaffold(
          backgroundColor: cGrey_200,
          appBar: appBarPrimary("Detail Laporan Rekap Tetap"),
          bottomNavigationBar: c.isLoading.value
              ? Container()
              : Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: cPrimary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "PPH21\n(PPH Bentukan - Pajak Insentif)",
                          style: textBoldLightMedium,
                        ),
                        Text(
                          FormatCurrency.convertToIdr(
                              c.detailRekapM!.data[0].pph21, 0),
                          style: customTextStyle(
                              FontWeight.w700, 15, Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
          body: c.isLoading.value
              ? Center(child: loadingPage())
              : ListView.builder(
                  itemCount: c.detailRekapM!.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = c.detailRekapM!.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          spaceHeight(10),
                          cardHeader(
                            data[index].nip,
                            data[index].namaKaryawan,
                            data[index].npwp,
                            data[index].totalGaji,
                          ),
                          spaceHeight(10),
                          cardTeratur(
                            data[index].teratur.uangMakan,
                            data[index].teratur.tjPulsa,
                            data[index].teratur.tjVitamin,
                            data[index].teratur.tjTransport,
                            data[index].teratur.uangMakan +
                                data[index].teratur.tjPulsa +
                                data[index].teratur.tjVitamin +
                                data[index].teratur.tjTransport,
                          ),
                          spaceHeight(10),
                          cardTidakTeratur(
                            data[index].tidakTeratur['lembur'],
                            data[index].tidakTeratur['penggantiBiayaKesehatan'],
                            data[index].tidakTeratur['uangDuka'],
                            data[index].tidakTeratur['spd'],
                            data[index].tidakTeratur['spdPendidikan'],
                            data[index].tidakTeratur['spdPindahTugas'],
                            data[index].tidakTeratur['insentifKredit'],
                            data[index].tidakTeratur['insentifPenagihan'],
                            data[index].tidakTeratur['lembur']! +
                                data[index]
                                    .tidakTeratur['penggantiBiayaKesehatan']! +
                                data[index].tidakTeratur['uangDuka']! +
                                data[index].tidakTeratur['spd']! +
                                data[index].tidakTeratur['spdPendidikan']! +
                                data[index].tidakTeratur['spdPindahTugas']! +
                                data[index].tidakTeratur['insentifKredit']! +
                                data[index].tidakTeratur['insentifPenagihan']!,
                          ),
                          spaceHeight(10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data[index].bonus.length,
                            itemBuilder: (context, index) {
                              var bonus = data[index].bonus;
                              return cardBonus(
                                bonus[index].brutoThr,
                                bonus[index].brutoDanaPendidikan,
                                bonus[index].brutoPenghargaanKinerja,
                                bonus[index].rekreasi,
                                bonus[index].brutoThr +
                                    bonus[index].brutoDanaPendidikan +
                                    bonus[index].brutoPenghargaanKinerja +
                                    bonus[index].rekreasi,
                              );
                            },
                          ),
                          spaceHeight(10),
                          penghasilBruto(data[index].penambahBruto),
                          spaceHeight(5),
                          totalBruto(data[index].bruto),
                          spaceHeight(5),
                          pph21Bentukan(data[index].pph21Bentukan),
                          spaceHeight(10),
                          ListView.builder(
                            itemCount: data[index].pajakInsentif.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var pajakInsentif = data[index].pajakInsentif;
                              return cardPajakInsentif(
                                pajakInsentif[index].kredit,
                                pajakInsentif[index].penagihan,
                                pajakInsentif[index].total,
                              );
                            },
                          ),
                          spaceHeight(20),
                        ],
                      ),
                    );
                  },
                )),
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
