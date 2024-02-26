import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/masa_pensiun/cabang_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CabangController extends GetxController {
  CabangModel? cabangM;
  var isLoading = false.obs;

  Future<void> getCabang() async {
    var headers = {'Content-Type': 'application/json'};

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/cabang"),
        headers: headers,
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        cabangM = CabangModel.fromJson(json);
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
