import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/penghasilan/list_penghasilan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListPenghasilanController extends GetxController {
  ListPenghasilanModel? penghasilanM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;
  var bulan = "".obs;
  List<bool>? isActiveList;

  Future<void> getListPenghasilan(status, page, cabang, DateTime tahun) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(cabang != null
            ? "$base_url/penghasilan?status=$status&page=$page&cabang=$cabang&tahun=${tahun.getYear()}${bulan.value == "" ? "" : "&bulan=${bulan.value}"}"
            : "$base_url/penghasilan?status=$status&page=$page&tahun=${tahun.getYear()}${bulan.value == "" ? "" : "&bulan=${bulan.value}"}"),
        headers: headers,
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          if (penghasilanM != null) {
            var newData = ListPenghasilanModel.fromJson(json);
            penghasilanM!.data.addAll(newData.data);
          } else {
            penghasilanM = ListPenghasilanModel.fromJson(json);
          }
          isActiveList = List.generate(
            penghasilanM?.data.length ?? 0,
            (index) => false,
          );
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
