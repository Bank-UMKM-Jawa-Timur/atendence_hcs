import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/masa_pensiun/divisi_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DivisiController extends GetxController {
  DivisiModel? divisiM;
  var isLoading = false.obs;

  Future<void> getDivisi() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/divisi"),
        headers: headers,
      );
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        divisiM = DivisiModel.fromJson(json);
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
