import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/pejabat_sementara/pejabat_sementara_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PejabatSementaraController extends GetxController {
  PejabatSementaraModel? pjsModel;
  var isLoading = false.obs;
  var isEmptyData = false.obs;

  Future<void> getListPjs(nip, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(nip == ""
            ? "$base_url/pjs?page=$page"
            : "$base_url/pjs?search=$nip"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          if (pjsModel?.data != null) {
            var newData = PejabatSementaraModel.fromJson(json);
            pjsModel!.data.addAll(newData.data);
          } else {
            pjsModel = PejabatSementaraModel.fromJson(json);
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
