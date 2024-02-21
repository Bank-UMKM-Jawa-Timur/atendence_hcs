import 'dart:convert';
import 'package:atendence_hcs/http/models/SDM/surat_peringatan/surat_peringatan_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SuratPeringatanController extends GetxController {
  SuratPeringatanModel? spM;
  var isLoading = false.obs;
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
    listDetailSp = [
      {
        "title": "NIP",
        "value": "....",
      },
      {
        "title": "Nama Karywan",
        "value": "....",
      },
      {
        "title": "No. SP",
        "value": "....",
      },
      {
        "title": "Tanggal SP",
        "value": "....",
      },
      {
        "title": "Jabatan",
        "value": "....",
      },
      {
        "title": "Kantor",
        "value": "....",
      },
      {
        "title": "Pelanggan",
        "value": "....",
      },
      {
        "title": "Sangsi",
        "value": "....",
      },
    ];
  }
}
