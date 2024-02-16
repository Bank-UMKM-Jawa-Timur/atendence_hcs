import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/pengkinian_data/list_pengkinian_data_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListPengkinianDataController extends GetxController {
  ListPengkinianDataModel? listPengkinianDataM;
  var isLoading = false.obs;

  Future<void> getListPengkinianData(nip) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/pengkinian-data?search=$nip"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
        listPengkinianDataM = ListPengkinianDataModel.fromJson(json);
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
