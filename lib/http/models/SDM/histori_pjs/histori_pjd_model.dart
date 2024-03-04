import 'dart:convert';

HistoriPjsModel historiPjsModelFromJson(String str) =>
    HistoriPjsModel.fromJson(json.decode(str));

String historiPjsModelToJson(HistoriPjsModel data) =>
    json.encode(data.toJson());

class HistoriPjsModel {
  int status;
  String message;
  List<Datum> data;

  HistoriPjsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoriPjsModel.fromJson(Map<String, dynamic> json) =>
      HistoriPjsModel(
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
  String? namaKaryawan;
  String? nip;
  String? kdEntitas;
  String? tanggalMulai;
  String? tanggalBerakhir;
  String? noSk;
  String? namaJabatan;
  String? namaBagian;
  String? namaCabang;
  String? displayJabatan;
  String? status;

  Datum({
    required this.namaKaryawan,
    required this.nip,
    required this.kdEntitas,
    required this.tanggalMulai,
    required this.tanggalBerakhir,
    required this.noSk,
    required this.namaJabatan,
    required this.namaBagian,
    required this.namaCabang,
    required this.displayJabatan,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaKaryawan: json["nama_karyawan"],
        nip: json["nip"],
        kdEntitas: json["kd_entitas"],
        tanggalMulai: json["tanggal_mulai"],
        tanggalBerakhir: json["tanggal_berakhir"],
        noSk: json["no_sk"],
        namaJabatan: json["nama_jabatan"],
        namaBagian: json["nama_bagian"],
        namaCabang: json["nama_cabang"],
        displayJabatan: json["display_jabatan"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "nama_karyawan": namaKaryawan,
        "nip": nip,
        "kd_entitas": kdEntitas,
        "tanggal_mulai": tanggalMulai,
        "tanggal_berakhir": tanggalBerakhir,
        "no_sk": noSk,
        "nama_jabatan": namaJabatan,
        "nama_bagian": namaBagian,
        "nama_cabang": namaCabang,
        "display_jabatan": displayJabatan,
        "status": status,
      };
}
