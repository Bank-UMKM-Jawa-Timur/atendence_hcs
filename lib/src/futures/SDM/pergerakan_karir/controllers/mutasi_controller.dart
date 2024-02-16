import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/pergerakan_karir/list_mutasi_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MutasiController extends GetxController {
  static MutasiController get to => Get.put(MutasiController());
  ListMutasiModel? mutasiM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  Future<void> getListMutasi(nip) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/pergerakan-karir/mutasi?search=$nip"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData.value = false;
          mutasiM = ListMutasiModel.fromJson(json);
        } else {
          isEmptyData.value = true;
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
