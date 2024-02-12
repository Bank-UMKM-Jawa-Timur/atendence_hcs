import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/card_payments.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/header_profile_sdm.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/list_card_item.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/rincian_data.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeSdm extends StatelessWidget {
  HomeSdm({super.key});
  PrefsController prefsC = Get.find<PrefsController>();

  List listIcon = [
    {
      "name": "Manajemen",
      "icon": "assets/icon/manajemen.png",
    },
    {
      "name": "Penghasilan",
      "icon": "assets/icon/penghasilan.png",
    },
    {
      "name": "Histori",
      "icon": "assets/icon/histori.png",
    },
    {
      "name": "Laporan",
      "icon": "assets/icon/laporan.png",
    },
  ];

  List listRician = [
    {
      'title': 'Karyawan',
      'icon': 'assets/icon/karyawan.png',
      'total': '1830',
      'date': 'Sabtu, 12 Feb 2024',
    },
    {
      'title': 'Karyawan Masuk',
      'icon': 'assets/icon/karyawan_masuk.png',
      'total': '30',
      'date': 'Sabtu, 12 Feb 2024',
    },
    {
      'title': 'Karyawan Keluar',
      'icon': 'assets/icon/karyawan_keluar.png',
      'total': '10',
      'date': 'Sabtu, 12 Feb 2024',
    },
    {
      'title': 'Karyawan Pensiun',
      'icon': 'assets/icon/karyawan_pensiun.png',
      'total': '2',
      'date': 'Sabtu, 12 Feb 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
    ));
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      primary: false,
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 2)),
        backgroundColor: cPrimary,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: heightStatusBar,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(25),
                headerHomeSdm(
                  prefsC.jenisKelamin.value,
                  prefsC.namaKaryawan.value,
                  prefsC.displayJabatan.value,
                ),
                spaceHeight(25),
                cardPayment(),
                spaceHeight(25),
                listCardItems(listIcon),
                spaceHeight(25),
                Container(
                  width: Get.width,
                  height: 1,
                  color: cGrey_400,
                ),
                spaceHeight(20),
                Text(
                  "Rincian Data",
                  style: customTextStyle(FontWeight.w600, 16, Colors.black),
                ),
                spaceHeight(20),
                listRincianData(listRician)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
