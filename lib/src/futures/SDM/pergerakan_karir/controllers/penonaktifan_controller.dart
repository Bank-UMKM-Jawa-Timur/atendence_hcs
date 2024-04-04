import 'dart:convert';
import 'package:atendence_hcs/http/models/SDM/pergerakan_karir/list_penonaktifan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PenonaktifanController extends GetxController {
  ListPenonaktifanModel? penonaktifanM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  getListPenonaktifan(nip, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(nip == ""
            ? "$base_url/pergerakan-karir/penonaktifan?page=$page"
            : "$base_url/pergerakan-karir/penonaktifan?search=$nip"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData.value = false;
          if (penonaktifanM?.data != null) {
            var newData = ListPenonaktifanModel.fromJson(json);
            penonaktifanM!.data.addAll(newData.data);
          } else {
            penonaktifanM = ListPenonaktifanModel.fromJson(json);
          }
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
