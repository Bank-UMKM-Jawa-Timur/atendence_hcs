import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/laporan_rekap_tetap/detail_rekap_tetap_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailRekapTetapController extends GetxController {
  DetailRekapTetapModel? detailRekapM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;
  var isFilterData = false.obs;

  Future<void> getRekapTetap(nip, tahun, bulan, kategori, kantor, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
            "$base_url/rekap-tetap/detail/$nip?kantor=$kantor&kategori=$kategori&bulan=$bulan&tahun=$tahun"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isFilterData(true);
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          detailRekapM = DetailRekapTetapModel.fromJson(json);
        } else {
          isEmptyData(true);
        }
      } else {
        debugPrint(response.statusCode.toString());
      }
      print(json);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
