import 'dart:convert';

DivisiModel divisiModelFromJson(String str) =>
    DivisiModel.fromJson(json.decode(str));

String divisiModelToJson(DivisiModel data) => json.encode(data.toJson());

class DivisiModel {
  int status;
  String message;
  List<Datum> data;

  DivisiModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DivisiModel.fromJson(Map<String, dynamic> json) => DivisiModel(
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
  String kdDivisi;
  String namaDivisi;

  Datum({
    required this.kdDivisi,
    required this.namaDivisi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kdDivisi: json["kd_divisi"],
        namaDivisi: json["nama_divisi"],
      );

  Map<String, dynamic> toJson() => {
        "kd_divisi": kdDivisi,
        "nama_divisi": namaDivisi,
      };
}
