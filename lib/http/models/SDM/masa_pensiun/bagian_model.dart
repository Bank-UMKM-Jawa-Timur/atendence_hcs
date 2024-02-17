import 'dart:convert';

BagianModel bagianModelFromJson(String str) =>
    BagianModel.fromJson(json.decode(str));

String bagianModelToJson(BagianModel data) => json.encode(data.toJson());

class BagianModel {
  int status;
  String message;
  List<Datum> data;

  BagianModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BagianModel.fromJson(Map<String, dynamic> json) => BagianModel(
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
  String kdBagian;
  String namaBagian;

  Datum({
    required this.kdBagian,
    required this.namaBagian,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kdBagian: json["kd_bagian"],
        namaBagian: json["nama_bagian"],
      );

  Map<String, dynamic> toJson() => {
        "kd_bagian": kdBagian,
        "nama_bagian": namaBagian,
      };
}
