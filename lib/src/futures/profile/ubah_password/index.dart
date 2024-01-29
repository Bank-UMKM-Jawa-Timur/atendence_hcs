import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahPassword extends StatefulWidget {
  const UbahPassword({super.key});

  @override
  State<UbahPassword> createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  bool _showPassLama = true;
  bool _showPassBaru = true;
  bool _showPassConfirm = true;
  void _toggle() {
    setState(() {
      _showPassLama = !_showPassLama;
    });
  }

  void _toggle2() {
    setState(() {
      _showPassBaru = !_showPassBaru;
    });
  }

  void _toggle3() {
    setState(() {
      _showPassConfirm = !_showPassConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: themeStatusBar,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text(
          "Ubah Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      bottomNavigationBar: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: SizedBox(
            height: 45,
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
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          children: [
            _passwordLama(),
            _passwordBaru(),
            _passwordConfirm(),
          ],
        ),
      ),
    );
  }

  Widget _passwordLama() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            width: 1,
            color: cPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: TextField(
            autocorrect: false,
            maxLines: 1,
            obscureText: _showPassLama,
            enableSuggestions: false,
            decoration: InputDecoration(
              label: const Text(
                "Password Lama",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: cPrimary,
                ),
              ),
              hintStyle: const TextStyle(color: cGrey_700),
              border: InputBorder.none,
              suffixIcon: InkWell(
                child: Icon(
                  _showPassLama
                      ? CommunityMaterialIcons.eye_off_outline
                      : CommunityMaterialIcons.eye_outline,
                  size: 26,
                  color: cGrey_700,
                ),
                onTap: () {
                  _toggle();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordBaru() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            width: 1,
            color: cPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: TextField(
            autocorrect: false,
            maxLines: 1,
            obscureText: _showPassBaru,
            enableSuggestions: false,
            decoration: InputDecoration(
              label: const Text(
                "Password Baru",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: cPrimary,
                ),
              ),
              hintStyle: const TextStyle(color: cGrey_700),
              border: InputBorder.none,
              suffixIcon: InkWell(
                child: Icon(
                  _showPassBaru
                      ? CommunityMaterialIcons.eye_off_outline
                      : CommunityMaterialIcons.eye_outline,
                  size: 26,
                  color: cGrey_700,
                ),
                onTap: () {
                  _toggle2();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordConfirm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            width: 1,
            color: cPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: TextField(
            autocorrect: false,
            maxLines: 1,
            obscureText: _showPassConfirm,
            enableSuggestions: false,
            decoration: InputDecoration(
              label: const Text(
                "Konfirmasi Password",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: cPrimary,
                ),
              ),
              hintStyle: const TextStyle(color: cGrey_700),
              border: InputBorder.none,
              suffixIcon: InkWell(
                child: Icon(
                  _showPassConfirm
                      ? CommunityMaterialIcons.eye_off_outline
                      : CommunityMaterialIcons.eye_outline,
                  size: 26,
                  color: cGrey_700,
                ),
                onTap: () {
                  _toggle3();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
