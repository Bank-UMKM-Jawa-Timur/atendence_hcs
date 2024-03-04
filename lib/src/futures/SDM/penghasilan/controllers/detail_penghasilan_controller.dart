import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/penghasilan/detail_penghasilan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailPenghasilanController extends GetxController {
  DetailPenghasilanModel? detailPenghasilanM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  Future<void> getDetailPenghasilan(id, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/penghasilan/detail/$id?page=$page"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          if (detailPenghasilanM != null) {
            var newData = DetailPenghasilanModel.fromJson(json);
            detailPenghasilanM!.data.addAll(newData.data);
          } else {
            detailPenghasilanM = DetailPenghasilanModel.fromJson(json);
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
