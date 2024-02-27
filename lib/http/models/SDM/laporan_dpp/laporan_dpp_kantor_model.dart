import 'dart:convert';

LaporanDppKantorModel laporanDppKantorModelFromJson(String str) =>
    LaporanDppKantorModel.fromJson(json.decode(str));

String laporanDppKantorModelToJson(LaporanDppKantorModel data) =>
    json.encode(data.toJson());

class LaporanDppKantorModel {
  int status;
  String message;
  List<Datum> data;

  LaporanDppKantorModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LaporanDppKantorModel.fromJson(Map<String, dynamic> json) =>
      LaporanDppKantorModel(
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
  String dpp;

  Datum({
    required this.nip,
    required this.namaKaryawan,
    required this.dpp,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        dpp: json["dpp"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "dpp": dpp,
      };
}
