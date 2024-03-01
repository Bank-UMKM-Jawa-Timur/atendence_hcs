import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LosConnectionPage extends StatelessWidget {
  const LosConnectionPage({super.key});
  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width / 1,
                height: Get.height / 3.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/no_connection.png"),
                )),
              ),
              spaceHeight(10),
              const Text(
                "Koneksi Internet Teputus!",
                style: textBoldDarkVeryLarge,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Uppss, koneksi anda terputus silahkan hubungkan ulang koneksi anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: cGrey_700),
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: cPrimary),
                  onPressed: () async {
                    ConnectivityResult result =
                        await Connectivity().checkConnectivity();
                    if (result == ConnectivityResult.none) {
                      debugPrint("NO INTERNET");
                    } else {
                      Get.back();
                    }
                  },
                  child: const Text(
                    "Coba lagi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
