import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_shadow.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RincianSlipGaji extends StatelessWidget {
  const RincianSlipGaji({super.key});

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
      body: Column(
        children: [
          _headerSlip(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  spaceHeight(15),
                  _cardDetailKarywan(),
                  spaceHeight(15),
                  _cardPendapatan(),
                  spaceHeight(10),
                  _cardPotongan(),
                  spaceHeight(10),
                  _cardTotalDiterima(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardDetailKarywan() {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: cGrey_400, width: 2),
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
                    "Nip",
                    style: customTextStyle(
                      FontWeight.w700,
                      12,
                      Colors.black,
                    ),
                  ),
                ],
              ),
              spaceHeight(5),
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
                    "Dasha Taran",
                    style: customTextStyle(
                      FontWeight.w700,
                      12,
                      Colors.black,
                    ),
                  ),
                ],
              ),
              spaceHeight(5),
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
                    "0198312903",
                    style: customTextStyle(
                      FontWeight.w700,
                      12,
                      Colors.black,
                    ),
                  ),
                ],
              ),
              spaceHeight(5),
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
                  Text(
                    "Staf Advisor",
                    style: customTextStyle(
                      FontWeight.w700,
                      12,
                      Colors.black,
                    ),
                  ),
                ],
              ),
              spaceHeight(5),
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
                    "05 Juli 2011",
                    style: customTextStyle(
                      FontWeight.w700,
                      12,
                      Colors.black,
                    ),
                  ),
                ],
              ),
              spaceHeight(5),
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
                    "12 Tahun, 6 Bulan",
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

  Widget _cardPendapatan() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pendapatan",
                      style: textBoldDarkMedium,
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Gaji Pokok",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 2.089.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tj. Keluarga",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 300.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tj. Jabatan",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 1.000.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tj. Kemahalan",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 360.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tj. Kesejahteraan",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 2.000.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Container(width: Get.width, height: 2, color: cGrey_400),
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
              color: cPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Pendapatan",
                    style: textBoldLightLarge,
                  ),
                  Text(
                    "Rp 5.900.000",
                    style: textBoldLightLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardPotongan() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Potongan",
                      style: textBoldDarkMedium,
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "JP BPJS TK 1%",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 57.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "DPP 5%",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 170.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "IURAN IK",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 5.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Container(width: Get.width, height: 2, color: cGrey_400),
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
              color: cPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Potongan",
                    style: textBoldLightLarge,
                  ),
                  Text(
                    "Rp 232.000",
                    style: textBoldLightLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardTotalDiterima() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Gaji Diterima (Take Home Pay)",
                      style: textBoldDarkMedium,
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Jumlah",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Rp 5.529.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Container(width: Get.width, height: 2, color: cGrey_400),
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
              color: cPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Text(
                "Lima Juta Lima Ratus Dua Puluh Tiga Sembilan Ribu",
                style: customTextStyle(FontWeight.w800, 13, Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _headerSlip() {
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: cPrimary),
              icon: const Icon(
                CommunityMaterialIcons.printer,
                size: 20,
              ),
              label: const Text("Cetak", style: textBoldLightMedium),
            ),
          ],
        ),
      ),
    );
  }
}
