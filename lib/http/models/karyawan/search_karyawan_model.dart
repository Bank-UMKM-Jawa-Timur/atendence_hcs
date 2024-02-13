import 'dart:convert';

SearchKaryawanModel searchKaryawanModelFromJson(String str) =>
    SearchKaryawanModel.fromJson(json.decode(str));

String searchKaryawanModelToJson(SearchKaryawanModel data) =>
    json.encode(data.toJson());

class SearchKaryawanModel {
  int status;
  String message;
  List<Datum> data;

  SearchKaryawanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchKaryawanModel.fromJson(Map<String, dynamic> json) =>
      SearchKaryawanModel(
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

  Datum({
    required this.nip,
    required this.namaKaryawan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
      };
}
