import 'dart:convert';

LaporanJamsostekKeseluruhanModel laporanJamsostekKeseluruhanModelFromJson(
        String str) =>
    LaporanJamsostekKeseluruhanModel.fromJson(json.decode(str));

String laporanJamsostekKeseluruhanModelToJson(
        LaporanJamsostekKeseluruhanModel data) =>
    json.encode(data.toJson());

class LaporanJamsostekKeseluruhanModel {
  int status;
  String message;
  List<Datum> data;

  LaporanJamsostekKeseluruhanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LaporanJamsostekKeseluruhanModel.fromJson(
          Map<String, dynamic> json) =>
      LaporanJamsostekKeseluruhanModel(
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
  int totalKaryawan;
  String kdKantor;
  String jp1;
  String jp2;
  String jkk;
  String jkm;
  String jht;
  String totalJp;
  String kantor;

  Datum({
    required this.totalKaryawan,
    required this.kdKantor,
    required this.jp1,
    required this.jp2,
    required this.jkk,
    required this.jkm,
    required this.jht,
    required this.totalJp,
    required this.kantor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        totalKaryawan: json["total_karyawan"],
        kdKantor: json["kd_kantor"],
        jp1: json["jp_1"],
        jp2: json["jp_2"],
        jkk: json["jkk"],
        jkm: json["jkm"],
        jht: json["jht"],
        totalJp: json["total_jp"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "total_karyawan": totalKaryawan,
        "kd_kantor": kdKantor,
        "jp_1": jp1,
        "jp_2": jp2,
        "jkk": jkk,
        "jkm": jkm,
        "jht": jht,
        "total_jp": totalJp,
        "kantor": kantor,
      };
}
