import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/home/home_sdm_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeSdmController extends GetxController {
  HomeSdmModel? homeSdmM;
  var isLoading = false.obs;
  List listRincian = [];
  var fullName = "oyy".obs;

  @override
  void onInit() {
    super.onInit();
    getDataHome();
  }

  Future<void> getDataHome() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    fullName.value = "${sharedPref.getString("nama_karyawan")}";
    var headers = {'Content-Type': 'application/json'};

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        homeSdmM = HomeSdmModel.fromJson(json);
        listRincian = [
          {
            'title': 'Aktif',
            'icon': 'assets/icon/karyawan.png',
            'total': homeSdmM!.data.totalKaryawan.toString(),
            'date': 'Sabtu, 12 Feb 2024',
            'color': Color(0xFFF9F7FF),
          },
          {
            'title': 'Masuk',
            'icon': 'assets/icon/karyawan_masuk.png',
            'total': homeSdmM!.data.karyawanMasuk.toString(),
            'date': 'Sabtu, 12 Feb 2024',
            'color': Color(0xFFF2FFF8),
          },
          {
            'title': 'Keluar',
            'icon': 'assets/icon/karyawan_keluar.png',
            'total': homeSdmM!.data.karyawanKeluar.toString(),
            'date': 'Sabtu, 12 Feb 2024',
            'color': Color(0xFFFFF1EF),
          },
          {
            'title': 'Pensiun',
            'icon': 'assets/icon/karyawan_pensiun.png',
            'total': homeSdmM!.data.karyawanPensiun.toString(),
            'date': 'Sabtu, 12 Feb 2024',
            'color': Color(0xFFFFF1FF),
          },
        ];
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
