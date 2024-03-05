import 'dart:convert';

RekapTetapModel rekapTetapModelFromJson(String str) =>
    RekapTetapModel.fromJson(json.decode(str));

String rekapTetapModelToJson(RekapTetapModel data) =>
    json.encode(data.toJson());

class RekapTetapModel {
  int status;
  String message;
  List<Datum> data;

  RekapTetapModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RekapTetapModel.fromJson(Map<String, dynamic> json) =>
      RekapTetapModel(
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
  String namaKaryawan;
  String nip;
  String npwp;
  String ptkp;
  int bruto;

  Datum({
    required this.namaKaryawan,
    required this.nip,
    required this.npwp,
    required this.ptkp,
    required this.bruto,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaKaryawan: json["nama_karyawan"],
        nip: json["nip"],
        npwp: json["npwp"],
        ptkp: json["ptkp"],
        bruto: json["bruto"],
      );

  Map<String, dynamic> toJson() => {
        "nama_karyawan": namaKaryawan,
        "nip": nip,
        "npwp": npwp,
        "ptkp": ptkp,
        "bruto": bruto,
      };
}
