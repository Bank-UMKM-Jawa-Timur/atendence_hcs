import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/profile/components/logout.dart';
import 'package:atendence_hcs/src/futures/profile/components/profile_image.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PrefsController prefsC = Get.put(PrefsController());
  SharedPreferences? prefs;
  bool _isBiomatric = false;
  var tes = true;
  void onBiomatric() {
    setState(() {
      _isBiomatric = !_isBiomatric;
    });
  }

  @override
  void initState() {
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
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  spaceHeight(50),
                  profileImage(prefsC.jenisKelamin.value),
                  spaceHeight(10),
                  Text(
                    prefsC.namaKaryawan.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  spaceHeight(8),
                  Text(
                    prefsC.displayJabatan.value.trim(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: cGrey_700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  spaceHeight(30),
                  // _bottomEditProfile(),
                  spaceHeight(30),
                  _listProfile(listProfile),
                  logout(context)
                ],
              ),
            ),
          )),
    );
  }

  Widget _listProfile(List<dynamic> listProfile) {
    return ListView.builder(
      itemCount: listProfile.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          highlightColor: Colors.white,
          splashColor: cPrimary_100,
          onTap: () {
            var route = listProfile[index]['route'];
            route != null ? Get.toNamed(route) : '';
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
                        value: _isBiomatric,
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

  Widget _bottomEditProfile() {
    return SizedBox(
      height: 40,
      width: Get.width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: cPrimary,
        ),
        child: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
