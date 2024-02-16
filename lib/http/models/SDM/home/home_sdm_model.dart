import 'dart:convert';

HomeSdmModel homeSdmModelFromJson(String str) =>
    HomeSdmModel.fromJson(json.decode(str));

String homeSdmModelToJson(HomeSdmModel data) => json.encode(data.toJson());

class HomeSdmModel {
  int status;
  String message;
  Data data;

  HomeSdmModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeSdmModel.fromJson(Map<String, dynamic> json) => HomeSdmModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String totalGaji;
  int totalKaryawan;
  int karyawanMasuk;
  int karyawanKeluar;
  int karyawanPensiun;

  Data({
    required this.totalGaji,
    required this.totalKaryawan,
    required this.karyawanMasuk,
    required this.karyawanKeluar,
    required this.karyawanPensiun,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalGaji: json["total_gaji"],
        totalKaryawan: json["total_karyawan"],
        karyawanMasuk: json["karyawan_masuk"],
        karyawanKeluar: json["karyawan_keluar"],
        karyawanPensiun: json["karyawan_pensiun"],
      );

  Map<String, dynamic> toJson() => {
        "total_gaji": totalGaji,
        "total_karyawan": totalKaryawan,
        "karyawan_masuk": karyawanMasuk,
        "karyawan_keluar": karyawanKeluar,
        "karyawan_pensiun": karyawanPensiun,
      };
}
