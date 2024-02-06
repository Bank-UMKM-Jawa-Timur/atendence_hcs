import 'dart:convert';

import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UbahPasswordController extends GetxController {
  TextEditingController nipC = TextEditingController();
  TextEditingController newPasswordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
  PrefsController prefsC = Get.find<PrefsController>();
  SharedPreferences? prefs;
  var isLoading = false.obs;

  Future<void> changePassword(bool fromLogin) async {
    prefs = await SharedPreferences.getInstance();
    prefsC.addPrefs();
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      Map body = {
        "nip": nipC.text,
        "password": newPasswordC.text,
      };

      if (nipC.text != prefsC.nip.value) {
        snackbarfailed("nip tidak cocok");
      } else {
        if (confirmPasswordC.text != newPasswordC.text) {
          snackbarfailed(
              "konfirmasi password harus sama dengan password baru.");
        } else {
          http.Response response = await http.post(
            Uri.parse("$base_url/change-password"),
            body: jsonEncode(body),
            headers: headers,
          );

          final json = jsonDecode(response.body);
          if (response.statusCode == 200) {
            prefs?.remove("pswd");
            await prefs?.setString('pswd', newPasswordC.text);
            if (fromLogin) {
              Get.offAllNamed(RouteNames.navigationBar);
            } else {
              Get.back();
            }
            snackbarSuccess(json['message']);
          } else {
            snackbarfailed("Terjadi kesalahan saat ubah password.");
          }
        }
      }
    } catch (e) {
      snackbarfailed(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
