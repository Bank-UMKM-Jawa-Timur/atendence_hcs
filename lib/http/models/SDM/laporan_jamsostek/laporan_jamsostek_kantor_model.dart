import 'dart:convert';

LaporanJamsostekKantorModel laporanJamsostekKantorModelFromJson(String str) =>
    LaporanJamsostekKantorModel.fromJson(json.decode(str));

String laporanJamsostekKantorModelToJson(LaporanJamsostekKantorModel data) =>
    json.encode(data.toJson());

class LaporanJamsostekKantorModel {
  int status;
  String message;
  List<Datum> data;

  LaporanJamsostekKantorModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LaporanJamsostekKantorModel.fromJson(Map<String, dynamic> json) =>
      LaporanJamsostekKantorModel(
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
  String nip;
  String namaKaryawan;
  String totalGaji;
  dynamic kdKantor;
  Perhitungan perhitungan;

  Datum({
    required this.nip,
    required this.namaKaryawan,
    required this.totalGaji,
    required this.kdKantor,
    required this.perhitungan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        totalGaji: json["total_gaji"],
        kdKantor: json["kd_kantor"],
        perhitungan: Perhitungan.fromJson(json["perhitungan"]),
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "total_gaji": totalGaji,
        "kd_kantor": kdKantor,
        "perhitungan": perhitungan.toJson(),
      };
}

class Perhitungan {
  String jp1;
  String jp2;
  String totalJp;
  String jkk;
  String jkm;
  String jht;

  Perhitungan({
    required this.jp1,
    required this.jp2,
    required this.totalJp,
    required this.jkk,
    required this.jkm,
    required this.jht,
  });

  factory Perhitungan.fromJson(Map<String, dynamic> json) => Perhitungan(
        jp1: json["jp_1"],
        jp2: json["jp_2"],
        totalJp: json["total_jp"],
        jkk: json["jkk"],
        jkm: json["jkm"],
        jht: json["jht"],
      );

  Map<String, dynamic> toJson() => {
        "jp_1": jp1,
        "jp_2": jp2,
        "total_jp": totalJp,
        "jkk": jkk,
        "jkm": jkm,
        "jht": jht,
      };
}
