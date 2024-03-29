import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/penghasilan/list_penghasilan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListPenghasilanController extends GetxController {
  ListPenghasilanModel? penghasilanM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  Future<void> getListPenghasilan(status, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/penghasilan?status=$status&page=$page"),
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
