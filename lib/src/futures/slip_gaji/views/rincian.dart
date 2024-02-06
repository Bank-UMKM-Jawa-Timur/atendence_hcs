import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/controllers/slip_gaji_controller.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/views/components/rincian/card_detail_karyawan.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/views/components/rincian/card_pendapatan.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/views/components/rincian/card_potongan.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/views/components/rincian/card_total_gaji_diterima.dart';
import 'package:atendence_hcs/src/pdf/slip_gaji/index.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shadow.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RincianSlipGaji extends StatelessWidget {
  RincianSlipGaji({super.key});
  SlipGajiController slipGajiC = Get.find<SlipGajiController>();
  PrefsController prefsC = Get.find<PrefsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: themeStatusBar,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text(
          "Rincian Slip Gaji",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(
        () => slipGajiC.isLoadingRincian.value
            ? loadingPage()
            : Column(
                children: [
                  headerSlip(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          spaceHeight(15),
                          cardDetailKarywan(
                            slipGajiC.rincianSlipGaji!.data.nip,
                            prefsC.namaKaryawan.value,
                            prefsC.noRekening.value,
                            prefsC.displayJabatan.value,
                            prefsC.tanggalBergabung.value,
                            prefsC.lamaKerja.value,
                          ),
                          spaceHeight(15),
                          cardPendapatan(
                            slipGajiC.rincianSlipGaji!.data.tjKeluarga,
                            slipGajiC.rincianSlipGaji!.data.tjJabatan,
                            slipGajiC.rincianSlipGaji!.data.gjPenyesuaian,
                            slipGajiC.rincianSlipGaji!.data.tjPerumahan,
                            slipGajiC.rincianSlipGaji!.data.tjTelepon,
                            slipGajiC.rincianSlipGaji!.data.tjPelaksana,
                            slipGajiC.rincianSlipGaji!.data.tjKemahalan,
                            slipGajiC.rincianSlipGaji!.data.tjKesejahteraan,
                            slipGajiC.rincianSlipGaji!.data.tjTeller,
                            slipGajiC.rincianSlipGaji!.data
                                .tjKhusus, // Gaji Pokok Belum
                            slipGajiC.rincianSlipGaji!.data.gjPokok,
                            slipGajiC.rincianSlipGaji!.data.dataList.totalGaji,
                          ),
                          spaceHeight(10),
                          cardPotongan(
                            slipGajiC.rincianSlipGaji!.data.bpjsTk,
                            slipGajiC.rincianSlipGaji!.data.potongan.dpp,
                            slipGajiC
                                .rincianSlipGaji!.data.potongan.kreditKoperasi,
                            slipGajiC
                                .rincianSlipGaji!.data.potongan.iuranKoperasi,
                            slipGajiC
                                .rincianSlipGaji!.data.potongan.kreditKoperasi,
                            slipGajiC.rincianSlipGaji!.data.iuranIk,
                            slipGajiC
                                .rincianSlipGaji!.data.potongan.totalPotongan,
                          ),
                          spaceHeight(10),
                          cardTotalGajiDiterima(
                            slipGajiC
                                .rincianSlipGaji!.data.dataList.totalDiterima,
                            slipGajiC.rincianSlipGaji!.data.terbilang,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget line() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: Get.width,
        height: 1,
        color: cGrey_400,
      ),
    );
  }

  Widget headerSlip() {
    return Container(
      width: Get.width,
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          shadowMedium,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                  height: 50,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                spaceWidth(10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Slip Gaji Pegawai",
                      style: textBoldDarkMedium,
                    ),
                    Text(
                      "Periode 2024 Januari",
                      style: textBoldDarkMedium,
                    ),
                    Text(
                      "Bank BPR Jatim",
                      style: textBoldDarkMedium,
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                SlipGajiPdf().downloadSlip(
                  slipGajiC.rincianSlipGaji!.data.nip,
                  prefsC.namaKaryawan.value,
                  prefsC.noRekening.value,
                  prefsC.displayJabatan.value,
                  prefsC.tanggalBergabung.value,
                  prefsC.lamaKerja.value,
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: cPrimary),
              icon: const Icon(
                CommunityMaterialIcons.printer,
                size: 20,
              ),
              label: const Text("Download", style: textBoldLightMedium),
            ),
          ],
        ),
      ),
    );
  }
}
