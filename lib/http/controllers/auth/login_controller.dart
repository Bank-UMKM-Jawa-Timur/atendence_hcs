import 'dart:convert';
import 'dart:io';
import 'package:atendence_hcs/http/models/auth/login_failed_model.dart';
import 'package:atendence_hcs/http/models/auth/login_model.dart';
import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/navigation_bar/index.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailNipController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferences? prefs;
  LoginModel? loginSucsess;
  LoginFailedModel? loginFailed;
  var isLoading = false.obs;

  Future<void> login() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      Map body = {
        "nip": emailNipController.text,
        "password": passwordController.text,
      };

      http.Response response = await http.post(
        Uri.parse("$base_url/login"),
        body: jsonEncode(body),
        headers: headers,
      );

      if (emailNipController.text == "" || passwordController.text == "") {
        snackbarfailed("Email(nip) atau password tidak boleh kosong.");
      } else {
        final json = jsonDecode(response.body);
        // check status http
        if (response.statusCode == 200) {
          // check status response failed or not
          if (json['status'] != 0) {
            loginSucsess = LoginModel.fromJson(json);
            // save to local storage
            // prefs = await SharedPreferences.getInstance();
            prefs = await SharedPreferences.getInstance();
            // prefs?.clear();
            // await prefs?.setString('nip', loginSucsess!.data.nip);
            // await prefs?.setString(
            //     'nama_karyawan', loginSucsess!.data.namaKaryawan);
            // await prefs?.setString(
            //     'jenis_kelamin', loginSucsess!.data.jenisKelamin);
            // await prefs?.setInt(
            //     'entitas_type', loginSucsess!.data.entitas.type);
            // await prefs?.setString(
            //     'display_jabatan', loginSucsess!.data.displayJabatan);

            // success
            emailNipController.clear();
            passwordController.clear();
            // Get.offAllNamed(RouteNames.navigationBar);
            // Get.offAll(BottomNavigationBarHome());
          } else {
            // if response failed
            loginFailed = LoginFailedModel.fromJson(json);
            print(loginFailed!.message);
            snackbarfailed(loginFailed!.message);
          }
        } else {
          snackbarfailed("Terjadi kesalahan saat login!.");
        }
      }
    } catch (e) {
      snackbarfailed("UYY " + e.toString());
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
