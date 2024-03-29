import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/src/futures/home/controllers/home_sdm_controller.dart';
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
  HomeSdmController homeSdmC = Get.find<HomeSdmController>();

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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
    ));
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      primary: false,
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 2),
            () => homeSdmC.getDataHome(),
          );
        },
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
                homeSdmC.isLoading.value
                    ? shimmerCardPayment()
                    : cardPayment(
                        homeSdmC.homeSdmM!.data.totalGaji.replaceAll('.', ','),
                      ),
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
                homeSdmC.isLoading.value
                    ? shimmerListRincianData()
                    : listRincianData(homeSdmC.listRincian)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
