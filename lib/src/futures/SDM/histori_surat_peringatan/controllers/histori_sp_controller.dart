import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/histori_sp/histori_sp_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HistoriSpController extends GetxController {
  HistoriSuratPeringatanModel? historiSpM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;
  var kategori = "Semua Data".obs;
  var typeFilter = false.obs;

  Future<void> getHistoriSp(nip, firstDate, lastDate, year) async {
    var headers = {'Content-Type': 'application/json'};
    var url = "$base_url/history/surat-peringatan?kategori=keseluruhan";

    try {
      isLoading(true);
      switch (kategori.value) {
        case "Semua Data":
          url = "$base_url/history/surat-peringatan?kategori=keseluruhan";
          break;
        case "Karyawan":
          url = "$base_url/history/surat-peringatan?kategori=karyawan&nip=$nip";
          break;
        case "Tanggal":
          url =
              "$base_url/history/surat-peringatan?kategori=tanggal&tanggal_awal=$firstDate&tanggal_akhir=$lastDate";
          break;
        case "Tahun":
          url = "$base_url/history/surat-peringatan?kategori=tahun&tahun=$year";
      }

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          historiSpM = HistoriSuratPeringatanModel.fromJson(json);
        } else {
          isEmptyData(true);
        }
      } else {
        debugPrint(response.statusCode.toString());
      }

      print(json);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
