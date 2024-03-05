import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/penghasilan/rincian_penghasilan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RincianPenghasilanController extends GetxController {
  RincianPenghasilanModel? rincianPenghasilanM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  Future<void> getRincianPenghasilan(id, bulan, tahun, nip) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
            "$base_url//penghasilan/rincian?batch_id=$id&bulan=$bulan&tahun=$tahun&nip=$nip&kategori=rincian"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          rincianPenghasilanM = RincianPenghasilanModel.fromJson(json);
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
