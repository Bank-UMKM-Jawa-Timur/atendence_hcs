import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/laporan_rekap_tetap/rekap_tetap_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RekapTetapController extends GetxController {
  RekapTetapModel? rekapM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;
  var isFilterData = false.obs;

  Future<void> getRekapTetap(tahun, bulan, kategori, kantor, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
            "$base_url/rekap-tetap?kantor=$kantor&kategori=$kategori&bulan=$bulan&tahun=$tahun&page=$page"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isFilterData(true);
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          if (rekapM != null) {
            var newData = RekapTetapModel.fromJson(json);
            rekapM!.data.addAll(newData.data);
          } else {
            rekapM = RekapTetapModel.fromJson(json);
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
