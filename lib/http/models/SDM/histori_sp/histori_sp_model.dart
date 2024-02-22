import 'dart:convert';

HistoriSuratPeringatanModel historiSuratPeringatanModelFromJson(String str) =>
    HistoriSuratPeringatanModel.fromJson(json.decode(str));

String historiSuratPeringatanModelToJson(HistoriSuratPeringatanModel data) =>
    json.encode(data.toJson());

class HistoriSuratPeringatanModel {
  int status;
  String message;
  List<Datum> data;

  HistoriSuratPeringatanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoriSuratPeringatanModel.fromJson(Map<String, dynamic> json) =>
      HistoriSuratPeringatanModel(
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
  String? nip;
  DateTime tanggalSp;
  String? noSp;
  String? pelanggaran;
  String? sanksi;
  String? namaKaryawan;
  String? kdEntitas;
  String? kantor;

  Datum({
    required this.id,
    required this.nip,
    required this.tanggalSp,
    required this.noSp,
    required this.pelanggaran,
    required this.sanksi,
    required this.namaKaryawan,
    required this.kdEntitas,
    required this.kantor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nip: json["nip"],
        tanggalSp: DateTime.parse(json["tanggal_sp"]),
        noSp: json["no_sp"],
        pelanggaran: json["pelanggaran"],
        sanksi: json["sanksi"],
        namaKaryawan: json["nama_karyawan"],
        kdEntitas: json["kd_entitas"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "tanggal_sp":
            "${tanggalSp.year.toString().padLeft(4, '0')}-${tanggalSp.month.toString().padLeft(2, '0')}-${tanggalSp.day.toString().padLeft(2, '0')}",
        "no_sp": noSp,
        "pelanggaran": pelanggaran,
        "sanksi": sanksi,
        "nama_karyawan": namaKaryawan,
        "kd_entitas": kdEntitas,
        "kantor": kantor,
      };
}
