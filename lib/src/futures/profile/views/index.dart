import 'dart:async';
import 'package:atendence_hcs/utils/components/my_short_two_caracter_name.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';

import '../../../../http/sharedpreferences/prefs.dart';
import '../../../../routes/route_name.dart';
import '../../../futures/profile/components/logout.dart';
import '../../../../utils/components/alert.dart';
import '../../../../utils/components/colors.dart';
import '../../../../utils/components/space.dart';
import '../../../../utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PrefsController prefsC = Get.find<PrefsController>();
  SharedPreferences? prefs;
  bool _isBiomatric = false;
  bool _supportState = false;
  late final LocalAuthentication auth;
  var tes = true;
  void onBiomatric() {
    setState(() {
      _isBiomatric = !_isBiomatric;
    });
    if (prefsC.biometric.value) {
      if (GetPlatform.isAndroid) {
        showAlertDialogAndroid(
          context,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cPrimary,
            ),
            onPressed: () {
              prefs?.remove("biometric");
              prefsC.addPrefs();
              Navigator.pop(context);
              alertSuccess(context);
              Timer(const Duration(seconds: 2), () {
                Get.back();
              });
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.white),
            ),
          ),
          "Informasi",
          "Apakah anda ingin nonaktifkan Biomatrik?",
        );
      } else {
        showCupertinoModalPopup<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("Informasi"),
            content: const Text("Apakah anda ingin nonaktifkan Biomatrik?"),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  prefs?.remove("biometric");
                  prefsC.addPrefs();
                  Navigator.pop(context);
                  alertSuccess(context);
                  Timer(const Duration(seconds: 2), () {
                    Get.back();
                  });
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      }
    } else {
      if (GetPlatform.isAndroid) {
        showAlertDialogAndroid(
          context,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cPrimary,
            ),
            onPressed: () {
              authenticate();
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.white),
            ),
          ),
          "Informasi",
          "Apakah anda ingin mengaktifkan Biomatrik?",
        );
      } else {
        showCupertinoModalPopup<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("Informasi"),
            content: const Text("Apakah anda ingin mengaktifkan Biomatrik?"),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  authenticate();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void initState() {
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
    addPrefs();
    super.initState();
  }

  addPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefsC.nip.value = "${prefs?.getString("nip")}";
    prefsC.namaKaryawan.value = "${prefs?.getString("nama_karyawan")}";
    prefsC.jenisKelamin.value = "${prefs?.getString("jenis_kelamin")}";
    prefsC.entitasType.value = "${prefs?.getInt("entitas_type")}";
    prefsC.displayJabatan.value = "${prefs?.getString("display_jabatan")}";
  }

  List listProfile = [
    {
      'title': "Profile Saya",
      'icon': const Icon(
        CommunityMaterialIcons.account_outline,
        color: cGrey_900,
        size: 23,
      ),
      'icon_left': null,
      'route': RouteNames.profileSaya,
    },
    {
      'title': "Ubah Password",
      'icon': const Icon(
        CommunityMaterialIcons.lock_reset,
        color: cGrey_900,
        size: 23,
      ),
      'icon_left': null,
      'route': RouteNames.ubahPassword,
    },
    {
      'title': "Autentikasi Biomatriks",
      'icon': const Icon(
        CommunityMaterialIcons.fingerprint,
        color: cGrey_900,
        size: 23,
      ),
      'icon_left': '1',
      'route': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: themeStatusBar,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceHeight(35),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: cPrimary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            shortTwoCaracterName(prefsC.namaKaryawan.value),
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      spaceWidth(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            shortenLastName(prefsC.namaKaryawan.value),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1.5,
                            child: Text(
                              prefsC.displayJabatan.value.trim(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: cGrey_700,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  spaceHeight(35),
                  const Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: cGrey_900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  _listProfile(listProfile, prefsC.biometric.value),
                  logout(context)
                ],
              ),
            ),
          )),
    );
  }

  Widget _listProfile(List<dynamic> listProfile, bool biomatrik) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: listProfile.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          highlightColor: Colors.white,
          splashColor: cPrimary_100,
          onTap: () {
            // print(prefsC.tipe.value);
            var route = listProfile[index]['route'];
            if (route != null) {
              if (prefsC.tipe.value != "User") {
                if (index == 1) {
                  Get.toNamed(route, arguments: false);
                } else {
                  Get.toNamed(
                    route,
                    arguments: {
                      'nip': prefsC.nip.value,
                      'title': "Profile Saya"
                    },
                  );
                }
              }
            } else {
              onBiomatric();
            }
          },
          child: Container(
            width: Get.width,
            height: 70,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: cGrey_400,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: cGrey_300,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: listProfile[index]['icon'],
                    ),
                    spaceWidth(10),
                    Text(
                      listProfile[index]['title'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                listProfile[index]!['icon_left'] != null
                    ? Switch(
                        activeColor: cPrimary,
                        value: biomatrik,
                        onChanged: (bool value) async {
                          onBiomatric();
                        },
                      )
                    : const Icon(
                        CommunityMaterialIcons.chevron_right,
                        size: 29,
                        color: cGrey_900,
                      )
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _bottomEditProfile() {
  //   return SizedBox(
  //     height: 40,
  //     width: Get.width,
  //     child: ElevatedButton(
  //       onPressed: () {},
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: cPrimary,
  //       ),
  //       child: const Text(
  //         "Edit Profile",
  //         style: TextStyle(
  //           fontSize: 14,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future<void> authenticate() async {
    prefs = await SharedPreferences.getInstance();
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: "Use your Finger or Face",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      if (!mounted) {
        return;
      }
      if (authenticated) {
        prefs?.remove("biometric");
        prefs?.setBool("biometric", true);
        prefsC.addPrefs();
        Get.back();
        alertSuccess(context);
        Timer(const Duration(seconds: 2), () {
          Get.back();
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
