import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/laporan/laporan_demosi_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LaporanDemosiConrtoller extends GetxController {
  LaporanDemosiModel? laporanDemosiM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;
  var isFilter = false.obs;

  Future<void> getLaporanDemosi(firstDate, lastDate, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
            "$base_url/laporan/demosi?tanggal_awal=$firstDate&tanggal_akhir=$lastDate&page=$page"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        isFilter(true);
        if (data.length > 0) {
          isEmptyData(false);
          if (laporanDemosiM != null) {
            var newData = LaporanDemosiModel.fromJson(json);
            laporanDemosiM!.data.addAll(newData.data);
          } else {
            laporanDemosiM = LaporanDemosiModel.fromJson(json);
          }
        } else {
          isEmptyData(true);
        }
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
