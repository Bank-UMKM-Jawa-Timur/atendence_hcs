import 'dart:convert';

import 'package:atendence_hcs/http/models/profile/biodata_model.dart';
import 'package:atendence_hcs/utils/base_url.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BiodataController extends GetxController {
  BiodataModel? biodataC;
  var isLoading = false.obs;
  var isActive = 0.obs;
  List dataListTitle = [].obs;
  List? dataListValue;
  var itemCountData = 0.obs;
  // Biodata Diri
  List<dynamic> titleBioDataDiri = [
    'NIP',
    'NIK',
    'Nama Karyawan',
    'Tempat Tanggal Lahir',
    'Umur',
    'Agama',
    'Jenis Kelamin',
    'Status Pernikahan',
    'Kewarganegaraan',
    'Alamat KTP',
    'Alamat Sekarang',
  ].obs;
  List dataTitleBioDataDiri = [].obs;
  List dataBiodataKaryawan = [].obs;

  // Norek & NPWP
  List<dynamic> titleNorekAndNpwp = [
    'No Rekening',
    'NPWP',
  ].obs;
  List dataTitleNorekAndNpwp = [].obs;

  // Jabatan
  List<dynamic> titleDataJabatan = [
    'Jabatan',
    'Pangkat',
    'Golongan',
    'Status Karywan',
    'Status Jabatan',
    'Keterangan Jabatan',
    'Tanggal Mulai',
    'Pendidikan Terakhir',
    'Pendidikan Major',
    'SK Pengangkatan',
    'Tanggal Pengangkatan',
    'Masa Kerja',
  ].obs;
  List dataTitleDataJabatan = [].obs;

  getBiodata(String nip) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse('$base_url/biodata/$nip'),
        headers: headers,
      );
      print("object");
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        biodataC = BiodataModel.fromJson(result);
        dataBiodataKaryawan = [
          biodataC?.data.biodata.nik,
          biodataC?.data.biodata.namaKaryawan,
          biodataC?.data.biodata.ttl,
          biodataC?.data.biodata.umur,
          biodataC?.data.biodata.agama,
          biodataC?.data.biodata.jenisKelamin,
          biodataC?.data.biodata.statusPernikahan,
          biodataC?.data.biodata.kewarganegaraan,
          biodataC?.data.biodata.alamatKtp,
          biodataC?.data.biodata.alamatSek,
        ];
        dataTitleBioDataDiri = [
          biodataC?.data.biodata.nip,
          biodataC?.data.biodata.nik,
          biodataC?.data.biodata.namaKaryawan,
          biodataC?.data.biodata.ttl,
          biodataC?.data.biodata.umur,
          biodataC?.data.biodata.agama,
          biodataC?.data.biodata.jenisKelamin,
          biodataC?.data.biodata.statusPernikahan,
          biodataC?.data.biodata.kewarganegaraan,
          biodataC?.data.biodata.alamatKtp,
          biodataC?.data.biodata.alamatSek,
        ];
        dataTitleNorekAndNpwp = [
          biodataC?.data.norekNpwp.noRek,
          biodataC?.data.norekNpwp.npwp,
        ];
        dataTitleDataJabatan = [
          biodataC?.data.dataJabatan.displayJabatan,
          biodataC?.data.dataJabatan.pangkat,
          biodataC?.data.dataJabatan.golongan,
          biodataC?.data.dataJabatan.statusKaryawan,
          biodataC?.data.dataJabatan.statusJabatan,
          biodataC?.data.dataJabatan.keteranganJabatan,
          biodataC?.data.dataJabatan.tanggalMulai,
          biodataC?.data.dataJabatan.pendidikanTerakhir,
          biodataC?.data.dataJabatan.pendidikanMajor,
          biodataC?.data.dataJabatan.skPengangkatan,
          biodataC?.data.dataJabatan.tanggalPengangkatan,
          biodataC?.data.dataJabatan.lamaKerja,
        ];
      } else {
        snackbarfailed("error fetching data ${response.statusCode}");
      }

      if (isActive.value == 0) {
        itemCountData.value = titleBioDataDiri.length;
        dataListTitle = titleBioDataDiri;
        dataListValue = dataTitleBioDataDiri;
      } else if (isActive.value == 1) {
        itemCountData.value = titleNorekAndNpwp.length;
        dataListTitle = titleNorekAndNpwp;
        dataListValue = dataTitleNorekAndNpwp;
      } else {
        itemCountData.value = titleDataJabatan.length;
        dataListTitle = titleDataJabatan;
        dataListValue = dataTitleDataJabatan;
      }
    } catch (e) {
      snackbarfailed(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
