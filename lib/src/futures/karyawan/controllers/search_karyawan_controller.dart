import 'dart:convert';

import 'package:atendence_hcs/http/models/karyawan/search_karyawan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchKaryawanController extends GetxController {
  TextEditingController searchC = TextEditingController();
  SearchKaryawanModel? searchKaryawanModel;
  var isLoading = false.obs;
  var dataIsEmpty = true.obs;

  Future<void> getSearch() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/karyawan/search?search=${searchC.text}"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (json['data'].length == 0) {
          dataIsEmpty(true);
        } else {
          dataIsEmpty(false);
          searchKaryawanModel = SearchKaryawanModel.fromJson(json);
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
