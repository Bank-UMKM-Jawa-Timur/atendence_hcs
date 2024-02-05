import 'dart:convert';
import 'package:atendence_hcs/http/controllers/auth/login_check.dart';
import 'package:atendence_hcs/http/models/auth/login_failed_model.dart';
import 'package:atendence_hcs/http/models/auth/login_model.dart';
import 'package:atendence_hcs/routes/route_name.dart';
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
            prefs = await SharedPreferences.getInstance();
            await prefs?.setString('nip', loginSucsess!.data.nip);
            await prefs?.setString(
                'nama_karyawan', loginSucsess!.data.namaKaryawan);
            await prefs?.setString(
                'jenis_kelamin', loginSucsess!.data.jenisKelamin);
            // await prefs?.setInt(
            //     'entitas_type', loginSucsess!.data.entitas.type);
            await prefs?.setString(
                'display_jabatan', loginSucsess!.data.displayJabatan);
            await prefs?.setString(
                'tanggal_bergabung', loginSucsess!.data.tanggalBergabung);
            await prefs?.setString('lama_kerja', loginSucsess!.data.lamaKerja);
            await prefs?.setString(
                'no_rekening', loginSucsess!.data.noRekening ?? '-');
            await prefs?.setString('pswd', passwordController.text);

            // success
            emailNipController.clear();
            passwordController.clear();
            Get.offAllNamed(RouteNames.navigationBar);
            snackbarSuccess("Login Berhasil");
          } else {
            // if response failed
            loginFailed = LoginFailedModel.fromJson(json);
            snackbarfailed(loginFailed!.message);
          }
        } else {
          snackbarfailed("Terjadi kesalahan saat login!.");
        }
      }
    } catch (e) {
      snackbarfailed(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    var headers = {'Content-Type': 'application/json'};
    try {
      var nip = prefs?.getString("nip");
      Map body = {
        "nip": nip,
      };
      // http
      http.Response response = await http.post(
        Uri.parse("$base_url/logout"),
        body: jsonEncode(body),
        headers: headers,
      );
      // check if status 200
      if (response.statusCode == 200) {
        prefs?.remove('nip');
        prefs?.remove('nama_karyawan');
        prefs?.remove('jenis_kelamin');
        // prefs?.remove('entitas_type');
        prefs?.remove('display_jabatan');
        prefs?.remove('tanggal_bergabung');
        prefs?.remove('lama_kerja');
        prefs?.remove('no_rekening');
        prefs?.remove("biometric");
        prefs?.remove("pswd");
        prefs?.clear();
        LoginCheck().check();
        snackbarSuccess("Logout Berhasil");
      } else {
        snackbarfailed(response.statusCode.toString());
      }
    } catch (e) {
      snackbarfailed(e.toString());
    }
  }

  checkAlreadyLogin() async {
    prefs = await SharedPreferences.getInstance();

    if (emailNipController.text == "" || passwordController.text == "") {
      snackbarfailed("Email(nip) atau password tidak boleh kosong.");
    } else {
      if (emailNipController.text != prefs?.getString("nip") ||
          passwordController.text != prefs?.getString("pswd")) {
        snackbarfailed("Email(nip) atau password tidak sesuai");
      } else {
        emailNipController.clear();
        passwordController.clear();
        Get.offAllNamed(RouteNames.navigationBar);
        snackbarSuccess("Login Berhasil");
      }
    }
  }
}
