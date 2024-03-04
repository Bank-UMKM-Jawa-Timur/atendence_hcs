import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/histori_pjs/histori_pjd_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HistoriPjsController extends GetxController {
  HistoriPjsModel? historiPjsM;
  var isLoading = false.obs;
  var valKategori = "aktif".obs;
  var isEmptyData = true.obs;
  var isFilterData = false.obs;

  Future<void> getHistoriPjs(nip, page) async {
    var headers = {'Content-Type': 'application/json'};

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
          valKategori.value == "Aktif"
              ? "$base_url/history/pjs?kategori=$valKategori&page=$page"
              : "$base_url/history/pjs?kategori=$valKategori&nip=$nip&page=$page",
        ),
        headers: headers,
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        isFilterData(true);
        if (data.length > 0) {
          isEmptyData(false);
          if (historiPjsM != null) {
            var newData = HistoriPjsModel.fromJson(json);
            historiPjsM!.data.addAll(newData.data);
          } else {
            historiPjsM = HistoriPjsModel.fromJson(json);
          }
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
