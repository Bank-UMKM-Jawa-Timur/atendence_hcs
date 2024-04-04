import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/pergerakan_karir/list_mutasi_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MutasiController extends GetxController {
  ListMutasiModel? mutasiM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  getListMutasi(nip, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(nip == ""
            ? "$base_url/pergerakan-karir/mutasi?page=$page"
            : "$base_url/pergerakan-karir/mutasi?search=$nip"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          if (mutasiM?.data != null) {
            var newData = ListMutasiModel.fromJson(json);
            mutasiM!.data.addAll(newData.data);
          } else {
            mutasiM = ListMutasiModel.fromJson(json);
          }
        } else {
          isEmptyData.value = true;
        }
      } else {
        debugPrint(response.statusCode.toString());
      }
      print(mutasiM!.data.length / page);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
