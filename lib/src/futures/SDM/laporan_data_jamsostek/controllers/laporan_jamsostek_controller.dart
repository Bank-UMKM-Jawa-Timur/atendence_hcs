import 'dart:convert';

import 'package:atendence_hcs/http/models/SDM/laporan_jamsostek/laporan_jamsostek_kantor_model.dart';
import 'package:atendence_hcs/http/models/SDM/laporan_jamsostek/laporan_jamsostek_keseluruhan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LaporanJamsostekController extends GetxController {
  LaporanJamsostekKeseluruhanModel? jamsostekKeseluruhanM;
  LaporanJamsostekKantorModel? jamsostekKantorM;
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

  Future<void> getLaporanJamsostekKeseluruhan() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
          // "$base_url/laporan/jamsostek?kategori=keseluruhan&tahun=${tahun.value}&bulan=${bulan.value}",
          "$base_url/laporan/jamsostek?kategori=keseluruhan&tahun=${tahun.value}&bulan=${bulan.value}",
        ),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        isFilter(true);
        if (data.length > 0) {
          isEmptyData(false);
          jamsostekKeseluruhanM =
              LaporanJamsostekKeseluruhanModel.fromJson(json);
          totalKeseluruhan.value = 0;
          for (var i = 0; i < jamsostekKeseluruhanM!.data.length; i++) {
            totalKeseluruhan.value += int.parse(
                jamsostekKeseluruhanM!.data[i].totalJp.replaceAll(".", ""));
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

  Future<void> getLaporanJamsostekKantor(kantor, kdCabang, page) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading2(true);
      http.Response response = await http.get(
        Uri.parse(
          kantor == "Pusat"
              ? "$base_url/laporan/jamsostek?kategori=kantor&kantor=pusat&tahun=${tahun.value}&bulan=${bulan.value}&page=$page"
              : "$base_url/laporan/jamsostek?kategori=kantor&kantor=cabang&kd_cabang=$kdCabang&tahun=${tahun.value}&bulan=${bulan.value}&page=$page",
        ),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        isFilter2(true);
        if (data.length > 0) {
          isEmptyData2(false);
          if (jamsostekKantorM != null) {
            var newData = LaporanJamsostekKantorModel.fromJson(json);
            jamsostekKantorM!.data.addAll(newData.data);
          } else {
            jamsostekKantorM = LaporanJamsostekKantorModel.fromJson(json);
          }
          totalKeseluruhan.value = 0;
          for (var i = 0; i < jamsostekKantorM!.data.length; i++) {
            totalKeseluruhan.value += int.parse(
              jamsostekKantorM!.data[i].perhitungan.totalJp.replaceAll(".", ""),
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
