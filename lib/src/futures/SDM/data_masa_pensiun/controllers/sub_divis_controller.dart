import 'dart:convert';
import 'package:atendence_hcs/http/models/SDM/masa_pensiun/sub_divisi_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SubDivisiController extends GetxController {
  SubDivisModel? subdivisiM;
  var isLoading = false.obs;
  var emptyData = true.obs;

  Future<void> getSubDivisi(kdDivisi) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/sub-divisi/$kdDivisi"),
        headers: headers,
      );
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'].length;
        if (data > 0) {
          emptyData(false);
          subdivisiM = SubDivisModel.fromJson(json);
        } else {
          emptyData(true);
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
