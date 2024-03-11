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
import 'package:fluttertoast/fluttertoast.dart';
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

  DateTime timeBackPresed = DateTime.now();

  Future<bool> onPop() async {
    final diference = DateTime.now().difference(timeBackPresed);
    final isExitWaring = diference >= const Duration(seconds: 2);

    timeBackPresed = DateTime.now();

    if (isExitWaring) {
      Fluttertoast.showToast(
        msg: "Tekan Lagi untuk Keluar",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0x8A272727),
        textColor: Colors.black,
      );
      return false;
    } else {
      Fluttertoast.cancel();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
    ));
    return WillPopScope(
      onWillPop: onPop,
      child: Scaffold(
        primary: false,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: Obx(
                  () => SliverAppBar(
                    backgroundColor: cPrimary,
                    foregroundColor: Colors.white,
                    title: headerHomeSdm(
                      prefsC.jenisKelamin.value,
                      prefsC.namaKaryawan.value,
                      prefsC.displayJabatan.value,
                    ),
                    actionsIconTheme: const IconThemeData(opacity: 0.0),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              "assets/images/header.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    floating: false,
                    pinned: true,
                    toolbarHeight: 80,
                    expandedHeight: 90,
                    forceElevated: innerBoxIsScrolled,
                  ),
                ),
              ),
            ];
          },
          body: SafeArea(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 80),
                child: RefreshIndicator(
                  onRefresh: () async {
                    // Future.delayed(
                    //   const Duration(seconds: 2),
                    //   () =>
                    // );
                    homeSdmC.getDataHome();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spaceHeight(20),
                          homeSdmC.isLoading.value
                              ? shimmerCardPayment()
                              : cardPayment(homeSdmC.homeSdmM!.data.totalGaji),
                          // spaceHeight(25),
                          // listCardItems(listIcon),
                          spaceHeight(10),
                          // Container(
                          //   width: Get.width,
                          //   height: 1,
                          //   color: cGrey_400,
                          // ),
                          spaceHeight(20),
                          Text(
                            "Rincian Data",
                            style: customTextStyle(
                                FontWeight.w600, 16, Colors.black),
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
              ),
            ),
          ),
        ),
        // body: RefreshIndicator(
        //   onRefresh: () {
        //     return Future.delayed(
        //       const Duration(seconds: 2),
        //       () => homeSdmC.getDataHome(),
        //     );
        //   },
        //   backgroundColor: cPrimary,
        //   color: Colors.white,
        //   child: Padding(
        //     padding: EdgeInsets.only(
        //       top: heightStatusBar,
        //       bottom: 10,
        //       left: 20,
        //       right: 20,
        //     ),
        //     child: Obx(
        //       () => Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           spaceHeight(25),
        //           headerHomeSdm(
        //             prefsC.jenisKelamin.value,
        //             prefsC.namaKaryawan.value,
        //             prefsC.displayJabatan.value,
        //           ),
        //           spaceHeight(25),
        //           homeSdmC.isLoading.value
        //               ? shimmerCardPayment()
        //               : cardPayment(
        //                   homeSdmC.homeSdmM!.data.totalGaji.replaceAll('.', ','),
        //                 ),
        //           spaceHeight(25),
        //           listCardItems(listIcon),
        //           spaceHeight(25),
        //           Container(
        //             width: Get.width,
        //             height: 1,
        //             color: cGrey_400,
        //           ),
        //           spaceHeight(20),
        //           Text(
        //             "Rincian Data",
        //             style: customTextStyle(FontWeight.w600, 16, Colors.black),
        //           ),
        //           spaceHeight(20),
        //           homeSdmC.isLoading.value
        //               ? shimmerListRincianData()
        //               : listRincianData(homeSdmC.listRincian)
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
