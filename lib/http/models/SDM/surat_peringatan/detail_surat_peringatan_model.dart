// To parse this JSON data, do
//
//     final detailSuratPeringatanModel = detailSuratPeringatanModelFromJson(jsonString);

import 'dart:convert';

DetailSuratPeringatanModel detailSuratPeringatanModelFromJson(String str) =>
    DetailSuratPeringatanModel.fromJson(json.decode(str));

String detailSuratPeringatanModelToJson(DetailSuratPeringatanModel data) =>
    json.encode(data.toJson());

class DetailSuratPeringatanModel {
  int status;
  String message;
  List<Datum> data;

  DetailSuratPeringatanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DetailSuratPeringatanModel.fromJson(Map<String, dynamic> json) =>
      DetailSuratPeringatanModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String nip;
  DateTime tanggalSp;
  String? noSp;
  String? pelanggaran;
  String? sanksi;
  String? fileSk;
  String? namaKaryawan;
  String? statusJabatan;
  String? ketJabatan;
  String? namaJabatan;
  String? kdEntitas;
  String? namaCabang;
  String? namaBagian;
  String? displayJabatan;

  Datum({
    required this.id,
    required this.nip,
    required this.tanggalSp,
    required this.noSp,
    required this.pelanggaran,
    required this.sanksi,
    required this.fileSk,
    required this.namaKaryawan,
    required this.statusJabatan,
    required this.ketJabatan,
    required this.namaJabatan,
    required this.kdEntitas,
    required this.namaCabang,
    required this.namaBagian,
    required this.displayJabatan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nip: json["nip"],
        tanggalSp: DateTime.parse(json["tanggal_sp"]),
        noSp: json["no_sp"],
        pelanggaran: json["pelanggaran"],
        sanksi: json["sanksi"],
        fileSk: json["file_sk"],
        namaKaryawan: json["nama_karyawan"],
        statusJabatan: json["status_jabatan"],
        ketJabatan: json["ket_jabatan"],
        namaJabatan: json["nama_jabatan"],
        kdEntitas: json["kd_entitas"],
        namaCabang: json["nama_cabang"],
        namaBagian: json["nama_bagian"],
        displayJabatan: json["display_jabatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "tanggal_sp":
            "${tanggalSp.year.toString().padLeft(4, '0')}-${tanggalSp.month.toString().padLeft(2, '0')}-${tanggalSp.day.toString().padLeft(2, '0')}",
        "no_sp": noSp,
        "pelanggaran": pelanggaran,
        "sanksi": sanksi,
        "file_sk": fileSk,
        "nama_karyawan": namaKaryawan,
        "status_jabatan": statusJabatan,
        "ket_jabatan": ketJabatan,
        "nama_jabatan": namaJabatan,
        "kd_entitas": kdEntitas,
        "nama_cabang": namaCabang,
        "nama_bagian": namaBagian,
        "display_jabatan": displayJabatan,
      };
}
