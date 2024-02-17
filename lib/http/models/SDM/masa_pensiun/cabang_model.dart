import 'dart:convert';

CabangModel cabangModelFromJson(String str) =>
    CabangModel.fromJson(json.decode(str));

String cabangModelToJson(CabangModel data) => json.encode(data.toJson());

class CabangModel {
  int status;
  String message;
  List<Datum> data;

  CabangModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CabangModel.fromJson(Map<String, dynamic> json) => CabangModel(
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
  String kdCabang;
  String namaCabang;

  Datum({
    required this.kdCabang,
    required this.namaCabang,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kdCabang: json["kd_cabang"],
        namaCabang: json["nama_cabang"],
      );

  Map<String, dynamic> toJson() => {
        "kd_cabang": kdCabang,
        "nama_cabang": namaCabang,
      };
}
