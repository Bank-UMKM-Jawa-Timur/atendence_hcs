import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/home/home_sdm_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeSdmController extends GetxController {
  HomeSdmModel? homeSdmM;
  var isLoading = false.obs;
  List listRincian = [];

  @override
  void onInit() {
    super.onInit();
    getDataHome();
  }

  Future<void> getDataHome() async {
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
            'title': 'Karyawan',
            'icon': 'assets/icon/karyawan.png',
            'total': homeSdmM!.data.totalKaryawan.toString(),
            'date': 'Sabtu, 12 Feb 2024',
          },
          {
            'title': 'Karyawan Masuk',
            'icon': 'assets/icon/karyawan_masuk.png',
            'total': homeSdmM!.data.karyawanMasuk.toString(),
            'date': 'Sabtu, 12 Feb 2024',
          },
          {
            'title': 'Karyawan Keluar',
            'icon': 'assets/icon/karyawan_keluar.png',
            'total': homeSdmM!.data.karyawanKeluar.toString(),
            'date': 'Sabtu, 12 Feb 2024',
          },
          {
            'title': 'Karyawan Pensiun',
            'icon': 'assets/icon/karyawan_pensiun.png',
            'total': homeSdmM!.data.karyawanPensiun.toString(),
            'date': 'Sabtu, 12 Feb 2024',
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