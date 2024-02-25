import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/masa_pensiun/data_masa_pensiun_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataMasaPensiunController extends GetxController {
  DataMasaPensiunModel? dataMasaPensiunM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;
  var isFilter = false.obs;
  var valDivisi = "".obs;
  var valSubDivisi = "".obs;
  var valBagian = "".obs;
  List<bool>? isActiveList;

  Future<String> getUrl(kategori, page) async {
    var url = "$base_url/reminder-pensiun?kategori=$kategori&page=$page";
    if (kategori == "Keseluruhan") {
      url = "$base_url/reminder-pensiun?kategori=$kategori&page=$page";
    } else if (kategori == "Divisi") {
      url =
          "$base_url/reminder-pensiun?kategori=divisi&divisi=${valDivisi.value}&page=$page";
    } else if (kategori == "Sub Divisi") {
      url =
          "$base_url/reminder-pensiun?kategori=sub_divisi&sub_divisi=${valSubDivisi.value}&page=$page";
    } else if (kategori == "Bagian") {
      url =
          "$base_url/reminder-pensiun?kategori=bagian&bagian=${valBagian.value}&page=$page";
    } else if (kategori == "Kantor") {
      url =
          "$base_url/reminder-pensiun?kategori=kantor&kantor=cabang&kd_cabang=001";
    }
    return url;
  }

  Future<void> getDataMasaPensiun(kategori, page) async {
    var headers = {'Content-Type': 'application/json'};
    String url = await getUrl(kategori, page);
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        isFilter(true);
        if (data.length > 0) {
          isEmptyData(false);
          if (dataMasaPensiunM != null) {
            var newData = DataMasaPensiunModel.fromJson(json);
            dataMasaPensiunM!.data.addAll(newData.data);
          } else {
            dataMasaPensiunM = DataMasaPensiunModel.fromJson(json);
          }
          isActiveList = List.generate(
              dataMasaPensiunM?.data.length ?? 0, (index) => false);
        } else {
          isEmptyData(true);
        }
        print(json);
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
