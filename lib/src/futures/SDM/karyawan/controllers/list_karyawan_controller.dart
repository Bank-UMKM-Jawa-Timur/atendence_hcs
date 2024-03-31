import 'dart:convert';

import 'package:atendence_hcs/http/models/karyawan/list_karyawan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListKaryawanController extends GetxController {
  ListKaryawanModel? listKaryawanM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  Future<void> getListKaryawan(nip, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(nip == ""
            ? "$base_url/karyawan?page=$page"
            : "$base_url/karyawan?search=$nip"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          if (nip == "") {
            if (listKaryawanM != null) {
              var newData = ListKaryawanModel.fromJson(json);
              listKaryawanM!.data.addAll(newData.data);
            } else {
              listKaryawanM = ListKaryawanModel.fromJson(json);
            }
          } else {
            listKaryawanM = ListKaryawanModel.fromJson(json);
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
