import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/histori_pjs/histori_pjd_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HistoriPjsController extends GetxController {
  HistoriPjsModel? historiPjsM;
  var isLoading = false.obs;
  var valKategori = "Aktif".obs;
  var isEmptyData = true.obs;

  Future<void> getHistoriPjs(nip) async {
    var headers = {'Content-Type': 'application/json'};
    print(valKategori);

    try {
      isLoading(true);
      if (valKategori.value != "Aktif" && nip == "") {
        snackbarfailed(
            "Anda Harus Cari Karyawan jika memilih kategori Karyawan");
      } else {
        http.Response response = await http.get(
          Uri.parse(
            valKategori.value == "Aktif"
                ? "$base_url/history/pjs?kategori=$valKategori"
                : "$base_url/history/pjs?kategori=$valKategori&nip=$nip",
          ),
          headers: headers,
        );
        var json = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var data = json['data'];
          if (data.length > 0) {
            isEmptyData(false);
            historiPjsM = HistoriPjsModel.fromJson(json);
          } else {
            isEmptyData(true);
          }
          print(json);
        } else {
          debugPrint(response.statusCode.toString());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
