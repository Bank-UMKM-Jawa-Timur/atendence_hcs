import 'dart:convert';

RincianGajiModel rincianGajiModelFromJson(String str) =>
    RincianGajiModel.fromJson(json.decode(str));

String rincianGajiModelToJson(RincianGajiModel data) =>
    json.encode(data.toJson());

class RincianGajiModel {
  int status;
  String message;
  List<Datum> data;

  RincianGajiModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RincianGajiModel.fromJson(Map<String, dynamic> json) =>
      RincianGajiModel(
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
  String? kdCabang;
  String kantor;
  int totalGaji;

  Datum({
    required this.kdCabang,
    required this.kantor,
    required this.totalGaji,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kdCabang: json["kd_cabang"],
        kantor: json["kantor"],
        totalGaji: json["total_gaji"],
      );

  Map<String, dynamic> toJson() => {
        "kd_cabang": kdCabang,
        "kantor": kantor,
        "total_gaji": totalGaji,
      };
}
