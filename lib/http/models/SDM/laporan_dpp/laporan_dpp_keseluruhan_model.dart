import 'dart:convert';

LaporanDppKeseluruhanModel laporanDppKeseluruhanModelFromJson(String str) =>
    LaporanDppKeseluruhanModel.fromJson(json.decode(str));

String laporanDppKeseluruhanModelToJson(LaporanDppKeseluruhanModel data) =>
    json.encode(data.toJson());

class LaporanDppKeseluruhanModel {
  int status;
  String message;
  List<Datum> data;

  LaporanDppKeseluruhanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LaporanDppKeseluruhanModel.fromJson(Map<String, dynamic> json) =>
      LaporanDppKeseluruhanModel(
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
  String kdEntitas;
  String totalDpp;
  String kantor;

  Datum({
    required this.kdEntitas,
    required this.totalDpp,
    required this.kantor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kdEntitas: json["kd_entitas"],
        totalDpp: json["total_dpp"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "kd_entitas": kdEntitas,
        "total_dpp": totalDpp,
        "kantor": kantor,
      };
}
