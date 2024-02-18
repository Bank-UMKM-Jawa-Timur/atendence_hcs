import 'dart:convert';

PejabatSementaraModel pejabatSementaraModelFromJson(String str) =>
    PejabatSementaraModel.fromJson(json.decode(str));

String pejabatSementaraModelToJson(PejabatSementaraModel data) =>
    json.encode(data.toJson());

class PejabatSementaraModel {
  int status;
  String message;
  List<Datum> data;

  PejabatSementaraModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PejabatSementaraModel.fromJson(Map<String, dynamic> json) =>
      PejabatSementaraModel(
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
  int id;
  String nip;
  DateTime tanggalMulai;
  dynamic tanggalBerakhir;
  String? namaKaryawan;
  String? kdEntitas;
  String? kdJabatan;
  String? namaJabatan;
  String? displayJabatan;

  Datum({
    required this.id,
    required this.nip,
    required this.tanggalMulai,
    required this.tanggalBerakhir,
    required this.namaKaryawan,
    required this.kdEntitas,
    required this.kdJabatan,
    required this.namaJabatan,
    required this.displayJabatan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nip: json["nip"],
        tanggalMulai: DateTime.parse(json["tanggal_mulai"]),
        tanggalBerakhir: json["tanggal_berakhir"],
        namaKaryawan: json["nama_karyawan"],
        kdEntitas: json["kd_entitas"],
        kdJabatan: json["kd_jabatan"],
        namaJabatan: json["nama_jabatan"],
        displayJabatan: json["display_jabatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "tanggal_mulai":
            "${tanggalMulai.year.toString().padLeft(4, '0')}-${tanggalMulai.month.toString().padLeft(2, '0')}-${tanggalMulai.day.toString().padLeft(2, '0')}",
        "tanggal_berakhir": tanggalBerakhir,
        "nama_karyawan": namaKaryawan,
        "kd_entitas": kdEntitas,
        "kd_jabatan": kdJabatan,
        "nama_jabatan": namaJabatan,
        "display_jabatan": displayJabatan,
      };
}
