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
  var page = 1;

  Future<void> getHistoriSp(nip, firstDate, lastDate, year, page) async {
    var headers = {'Content-Type': 'application/json'};
    var url =
        "$base_url/history/surat-peringatan?kategori=keseluruhan&page=$page";

    try {
      isLoading(true);
      switch (kategori.value) {
        case "Semua Data":
          url =
              "$base_url/history/surat-peringatan?kategori=keseluruhan&page=$page";
          break;
        case "Karyawan":
          url =
              "$base_url/history/surat-peringatan?kategori=karyawan&nip=$nip&page=$page";
          break;
        case "Tanggal":
          url =
              "$base_url/history/surat-peringatan?kategori=tanggal&tanggal_awal=$firstDate&tanggal_akhir=$lastDate&page=$page";
          break;
        case "Tahun":
          url =
              "$base_url/history/surat-peringatan?kategori=tahun&tahun=$year&page=$page";
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
          if (historiSpM != null) {
            var newData = HistoriSuratPeringatanModel.fromJson(json);
            historiSpM!.data.addAll(newData.data);
          } else {
            historiSpM = HistoriSuratPeringatanModel.fromJson(json);
          }
          page++;
        } else {
          isEmptyData(true);
        }
      } else {
        debugPrint(response.statusCode.toString());
      }

      // print(json);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
