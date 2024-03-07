import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/home/rincian_gaji_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailPaymentController extends GetxController {
  RincianGajiModel? rincianGajiM;
  var isLoading = false.obs;
  var dataIsEmpty = true.obs;

  Future<void> getGaji() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/rincian-gaji"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (json['data'].length == 0) {
          dataIsEmpty(true);
        } else {
          dataIsEmpty(false);
          rincianGajiM = RincianGajiModel.fromJson(json);
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
