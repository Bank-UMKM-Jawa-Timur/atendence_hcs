import 'dart:convert';

SubDivisModel subDivisModelFromJson(String str) =>
    SubDivisModel.fromJson(json.decode(str));

String subDivisModelToJson(SubDivisModel data) => json.encode(data.toJson());

class SubDivisModel {
  int status;
  String message;
  List<Datum> data;

  SubDivisModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubDivisModel.fromJson(Map<String, dynamic> json) => SubDivisModel(
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
  String kdSubdiv;
  String namaSubdivisi;

  Datum({
    required this.kdSubdiv,
    required this.namaSubdivisi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kdSubdiv: json["kd_subdiv"],
        namaSubdivisi: json["nama_subdivisi"],
      );

  Map<String, dynamic> toJson() => {
        "kd_subdiv": kdSubdiv,
        "nama_subdivisi": namaSubdivisi,
      };
}
