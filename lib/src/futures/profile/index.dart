import '../utils/components/colors.dart';
import '../utils/components/space.dart';
import '../utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List listProfile = [
      {
        'title': "Profile Saya",
        'icon': const Icon(
          CommunityMaterialIcons.account_outline,
          color: cGrey_900,
          size: 23,
        ),
        'icon_left': null,
      },
      {
        'title': "Ubah Password",
        'icon': const Icon(
          CommunityMaterialIcons.lock_reset,
          color: cGrey_900,
          size: 23,
        ),
        'icon_left': null,
      },
      {
        'title': "Autentikasi Biomatriks",
        'icon': const Icon(
          CommunityMaterialIcons.fingerprint,
          color: cGrey_900,
          size: 23,
        ),
        'icon_left': Switch(
          activeColor: Colors.red[900],
          value: false,
          onChanged: (bool value) async {},
        ),
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: themeStatusBar,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              spaceHeight(30),
              _profileImage(),
              spaceHeight(5),
              const Text(
                "Dasha Taran",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              spaceHeight(4),
              const Text(
                "Service Advisor",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: cGrey_700,
                ),
              ),
              spaceHeight(20),
              _bottomEditProfile(),
              spaceHeight(30),
              _listProfile(listProfile),
              _logout()
            ],
          ),
        ),
      ),
    );
  }

  Widget _listProfile(List<dynamic> listProfile) {
    return ListView.builder(
      itemCount: listProfile.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
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
                  ? listProfile[index]!['icon_left']
                  : const Icon(
                      CommunityMaterialIcons.chevron_right,
                      size: 29,
                      color: cGrey_900,
                    )
            ],
          ),
        );
      },
    );
  }

  Widget _logout() {
    return SizedBox(
      width: Get.width,
      height: 70,
      child: InkWell(
        highlightColor: Colors.white,
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: cPrimary_300,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: const Icon(
                CommunityMaterialIcons.logout_variant,
                color: cPrimary,
                size: 21,
              ),
            ),
            spaceWidth(10),
            const Text(
              "Logout",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: cPrimary,
              ),
            ),
          ],
        ),
      ),
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

  Widget _profileImage() {
    return SizedBox(
      width: 120,
      height: 120,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/icon/female.jpg'),
                ),
              ),
            ),
            Positioned(
              left: 70,
              top: 70,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: cPrimary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      CommunityMaterialIcons.camera_outline,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
