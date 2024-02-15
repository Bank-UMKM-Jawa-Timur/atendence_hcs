import 'dart:convert';

import 'package:atendence_hcs/http/models/karyawan/list_karyawan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListKaryawanController extends GetxController {
  ListKaryawanModel? listKaryawanM;
  var isLoading = false.obs;

  Future<void> getListKaryawan(nip) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/karyawan?search=$nip"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
        listKaryawanM = ListKaryawanModel.fromJson(json);
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
