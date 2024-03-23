import 'dart:convert';
import 'package:atendence_hcs/src/auth/controllers/login_check.dart';
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
            await prefs?.setString('nip', loginSucsess!.data.nip ?? 'null');
            await prefs?.setString(
                'nama_karyawan', loginSucsess!.data.namaKaryawan ?? 'null');
            await prefs?.setString(
                'jenis_kelamin', loginSucsess!.data.jenisKelamin ?? 'null');
            // await prefs?.setInt(
            //     'entitas_type', loginSucsess!.data.entitas.type);
            await prefs?.setString(
                'display_jabatan', loginSucsess!.data.displayJabatan ?? 'null');
            await prefs?.setString('tanggal_bergabung',
                loginSucsess!.data.tanggalBergabung ?? 'null');
            await prefs?.setString(
                'lama_kerja', loginSucsess!.data.lamaKerja ?? 'null');
            await prefs?.setString(
                'no_rekening', loginSucsess!.data.noRekening ?? '-');
            await prefs?.setString('tipe', loginSucsess!.data.tipe ?? 'null');
            await prefs?.setString('pswd', passwordController.text);
            if (loginSucsess?.data.tipe == "User") {
              await prefs?.setString('email', emailNipController.text);
            }

            // success
            if (emailNipController.text == passwordController.text) {
              Get.offAllNamed(RouteNames.ubahPassword, arguments: true);
              snackbarSuccess(
                "Login Berhasil, Silahkan Ubah Password anda untuk keamanan akun anda.",
              );
            } else {
              if (loginSucsess?.data.tipe == "User") {
                Get.offAllNamed(RouteNames.navigationBarSdm);
                snackbarSuccess("Login Berhasil");
              } else {
                Get.offAllNamed(RouteNames.navigationBar);
                snackbarSuccess("Login Berhasil");
              }
            }
            emailNipController.clear();
            passwordController.clear();
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
      var tipe = prefs?.getString("tipe");
      var email = prefs?.getString("email");

      Map body = {
        "nip": tipe == "User" ? email : nip,
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
        prefs?.remove("tipe");
        prefs?.remove("email");
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
    var emailNip = prefs?.getString("tipe") == "User"
        ? prefs?.getString("email")
        : prefs?.getString("nip");
    if (emailNipController.text == "" || passwordController.text == "") {
      snackbarfailed("Email(nip) atau password tidak boleh kosong.");
    } else {
      if (emailNipController.text != emailNip ||
          passwordController.text != prefs?.getString("pswd")) {
        snackbarfailed("Email(nip) atau password tidak sesuai");
      } else {
        emailNipController.clear();
        passwordController.clear();
        if (prefs?.getString("tipe") == "User") {
          Get.offAllNamed(RouteNames.homeSdm);
        } else {
          Get.offAllNamed(RouteNames.navigationBar);
        }
        snackbarSuccess("Login Berhasil");
      }
    }
  }
}
