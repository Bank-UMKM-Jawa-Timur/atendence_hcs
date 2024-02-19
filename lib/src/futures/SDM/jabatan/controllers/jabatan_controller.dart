import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/jaminan/histori_jaminan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HistoriJabatanController extends GetxController {
  HistoriJabatanModel? jabatanM;
  var isLoading = false.obs;
  var isEmptyData = false.obs;

  Future<void> getJabatan(nip) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/history/jabatan/$nip"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          jabatanM = HistoriJabatanModel.fromJson(json);
        } else {
          isEmptyData(true);
        }
        print(json);
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
