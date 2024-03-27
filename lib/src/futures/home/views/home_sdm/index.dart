import 'package:atendence_hcs/src/futures/home/controllers/home_sdm_controller.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/card_payments.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/header_profile_sdm.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/rincian_data.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/rincian_data.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeSdm extends StatelessWidget {
  const HomeSdm({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime timeBackPresed = DateTime.now();
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
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

    return Scaffold(
        backgroundColor: cPrimary_200,
        body: GetX<HomeSdmController>(
          init: HomeSdmController(),
          initState: (_) {},
          builder: (c) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/header_sdm.png"),
                        fit: BoxFit.fitWidth),
                    color: cPrimary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spaceHeight(heightStatusBar + 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi Rhomaedi",
                                  style: customTextStyle(
                                      FontWeight.w700, 22, cWhite),
                                ),
                                Text(
                                  "Senin, Feb 26, 2024",
                                  style: customTextStyle(
                                    FontWeight.w400,
                                    12,
                                    cPrimary_100,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 65,
                                  height: 65,
                                  decoration: const BoxDecoration(
                                    color: cPrimary_600,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(65),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.notifications_none,
                                      size: 25,
                                      color: cWhite,
                                    ),
                                  ),
                                ),
                                spaceWidth(5),
                                Container(
                                  width: 65,
                                  height: 65,
                                  decoration: const BoxDecoration(
                                    color: cPrimary_600,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(65),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "RH",
                                    style: customTextStyle(
                                      FontWeight.w600,
                                      22,
                                      cWhite,
                                    ),
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                        spaceHeight(32),
                        Text(
                          "Perkiraan Gaji",
                          style: customTextStyle(FontWeight.w600, 17, cWhite),
                        ),
                        spaceHeight(7),
                        Text(
                          "Rp 450.000.000",
                          style: customTextStyle(FontWeight.w800, 33, cWhite),
                        ),
                        spaceHeight(7),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: cPrimary_100,
                              size: 22,
                            ),
                            spaceWidth(8),
                            Text(
                              "Bulan Ini",
                              style:
                                  customTextStyle(FontWeight.w600, 14, cWhite),
                            ),
                          ],
                        ),
                        spaceHeight(20),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: cPrimary_600,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Lihat Detail",
                                    style: customTextStyle(
                                      FontWeight.w500,
                                      15,
                                      cWhite,
                                    ),
                                  ),
                                  spaceWidth(3),
                                  const RotationTransition(
                                    turns: AlwaysStoppedAnimation(140 / 360),
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                      color: cWhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        spaceHeight(10),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Rincian Karyawan",
                    style: customTextStyle(
                      FontWeight.w500,
                      17,
                      cBlack,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: c.isLoading.value
                        ? const Text("Loading...")
                        : listRincianData(c.listRincian),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
