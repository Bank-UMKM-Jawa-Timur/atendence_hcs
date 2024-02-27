import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/laporan_dpp/laporan_dpp_kantor_model.dart';
import 'package:atendence_hcs/http/models/SDM/laporan_dpp/laporan_dpp_keseluruhan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LaporanDppController extends GetxController {
  LaporanDppKeseluruhanModel? dppKeseluruhanM;
  LaporanDppKantorModel? dppKantorM;
  // for kategori keseluruhan
  var isLoading = false.obs;
  var isEmptyData = true.obs;
  var isFilter = false.obs;
  // for Kantor
  var isLoading2 = false.obs;
  var isEmptyData2 = true.obs;
  var isFilter2 = false.obs;
  var tahun = DateTime.now().getYear().obs;
  var bulan = "".obs;
  var totalKeseluruhan = 0.obs;

  Future<void> getLaporanDppKeseluruhan() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
          "$base_url/laporan/dpp?kategori=keseluruhan&tahun=${tahun.value}&bulan=${bulan.value}",
        ),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        isFilter(true);
        if (data.length > 0) {
          isEmptyData(false);
          dppKeseluruhanM = LaporanDppKeseluruhanModel.fromJson(json);
          totalKeseluruhan.value = 0;
          for (var i = 0; i < dppKeseluruhanM!.data.length; i++) {
            totalKeseluruhan.value += int.parse(
                dppKeseluruhanM!.data[i].totalDpp.replaceAll(".", ""));
          }
        } else {
          isEmptyData(true);
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

  Future<void> getLaporanDppKantor(kantor, kdCabang, page) async {
    var headers = {'Content-Type': 'application/json'};
    print(page);
    try {
      isLoading2(true);
      http.Response response = await http.get(
        Uri.parse(
          kantor == "Pusat"
              ? "$base_url/laporan/dpp?kategori=kantor&kantor=pusat&tahun=${tahun.value}&bulan=${bulan.value}&page=$page"
              : "$base_url/laporan/dpp?kategori=kantor&kantor=cabang&kd_cabang=$kdCabang&tahun=${tahun.value}&bulan=${bulan.value}&page=$page",
          // laporan/dpp?kategori=kantor&kantor=cabang&tahun=2024&bulan=01&kd_cabang=001&page=1
        ),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        isFilter2(true);
        if (data.length > 0) {
          isEmptyData2(false);
          if (dppKantorM != null) {
            var newData = LaporanDppKantorModel.fromJson(json);
            dppKantorM!.data.addAll(newData.data);
          } else {
            dppKantorM = LaporanDppKantorModel.fromJson(json);
          }
          // dppKantorM = LaporanDppKantorModel.fromJson(json);
          totalKeseluruhan.value = 0;
          for (var i = 0; i < dppKantorM!.data.length; i++) {
            totalKeseluruhan.value += int.parse(
              dppKantorM!.data[i].dpp.replaceAll(".", ""),
            );
          }
        } else {
          isEmptyData2(true);
        }
      } else {
        debugPrint(response.statusCode.toString());
      }
      print(json);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading2(false);
    }
  }
}
