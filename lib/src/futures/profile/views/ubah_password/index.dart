import 'package:atendence_hcs/src/futures/profile/controllers/ubah_password_controller.dart';
import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_radius.dart';
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
  UbahPasswordController ubahPasswordC = Get.put(UbahPasswordController());
  PrefsController prefsC = Get.put(PrefsController());
  bool _showPassBaru = true;
  bool _showPassConfirm = true;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          "Ubah Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: cPrimary,
        elevation: 1,
      ),
      bottomNavigationBar: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: SizedBox(
            height: 45,
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {
                prefsC.addPrefs();
                ubahPasswordC.changePassword(Get.arguments!);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cPrimary,
                shape: radiusElevetedBtn,
              ),
              child: const Text(
                "Ubah Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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
            _formNip(),
            _passwordBaru(),
            _passwordConfirm(),
          ],
        ),
      ),
    );
  }

  Widget _formNip() {
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
            controller: ubahPasswordC.nipC,
            enableSuggestions: false,
            decoration: const InputDecoration(
              label: Text(
                "Nip",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: cPrimary,
                ),
              ),
              hintStyle: TextStyle(color: cGrey_700),
              border: InputBorder.none,
              // suffixIcon: InkWell(
              //   child: Icon(
              //     _showPassLama
              //         ? CommunityMaterialIcons.eye_off_outline
              //         : CommunityMaterialIcons.eye_outline,
              //     size: 26,
              //     color: cGrey_700,
              //   ),
              //   onTap: () {
              //     _toggle();
              //   },
              // ),
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
            controller: ubahPasswordC.newPasswordC,
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
            controller: ubahPasswordC.confirmPasswordC,
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
