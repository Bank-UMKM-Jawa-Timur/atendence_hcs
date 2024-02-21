import 'dart:convert';
import 'package:atendence_hcs/http/models/SDM/surat_peringatan/detail_surat_peringatan_model.dart';
import 'package:atendence_hcs/http/models/SDM/surat_peringatan/surat_peringatan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SuratPeringatanController extends GetxController {
  SuratPeringatanModel? spM;
  DetailSuratPeringatanModel? detailSpM;
  var isLoading = false.obs;
  var isLoadingDetail = false.obs;
  var isEmptyData = false.obs;
  List listDetailSp = [];

  Future<void> getListSP(nip) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/surat-peringatan?search=$nip"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        if (data.length > 0) {
          isEmptyData(false);
          spM = SuratPeringatanModel.fromJson(json);
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

  Future<void> getDetailSp(nip) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoadingDetail(true);
      http.Response response = await http.get(
        Uri.parse("$base_url/surat-peringatan/$nip"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        detailSpM = DetailSuratPeringatanModel.fromJson(json);
        listDetailSp = [
          {
            "title": "NIP",
            "value": detailSpM?.data.nip,
          },
          {
            "title": "Nama Karywan",
            "value": detailSpM?.data.namaKaryawan,
          },
          {
            "title": "No. SP",
            "value": detailSpM?.data.noSp ?? '-',
          },
          {
            "title": "Tanggal SP",
            "value": detailSpM?.data.tanggalSp.fullDateAll().toString(),
          },
          {
            "title": "Jabatan",
            "value": detailSpM?.data.displayJabatan?.trim(),
          },
          {
            "title": "Kantor",
            "value": detailSpM?.data.namaCabang ?? '-',
          },
          {
            "title": "Pelanggan",
            "value": detailSpM?.data.pelanggaran ?? '-',
          },
          {
            "title": "Sanksi",
            "value": detailSpM?.data.sanksi ?? '-',
          },
        ];
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingDetail(false);
    }
  }
}
