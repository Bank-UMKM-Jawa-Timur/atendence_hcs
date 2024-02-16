import 'dart:convert';

ListPromosiModel listPromosiModelFromJson(String str) =>
    ListPromosiModel.fromJson(json.decode(str));

String listPromosiModelToJson(ListPromosiModel data) =>
    json.encode(data.toJson());

class ListPromosiModel {
  int status;
  String message;
  List<Datum> data;

  ListPromosiModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ListPromosiModel.fromJson(Map<String, dynamic> json) =>
      ListPromosiModel(
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
  String tanggalPengesahan;
  String jabatanLama;
  String jabatanBaru;
  String kantorLama;
  String kantorBaru;
  String buktiSk;

  Datum({
    required this.nip,
    required this.namaKaryawan,
    required this.tanggalPengesahan,
    required this.jabatanLama,
    required this.jabatanBaru,
    required this.kantorLama,
    required this.kantorBaru,
    required this.buktiSk,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        tanggalPengesahan: json["tanggal_pengesahan"],
        jabatanLama: json["jabatan_lama"],
        jabatanBaru: json["jabatan_baru"],
        kantorLama: json["kantor_lama"],
        kantorBaru: json["kantor_baru"],
        buktiSk: json["bukti_sk"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "tanggal_pengesahan": tanggalPengesahan,
        "jabatan_lama": jabatanLama,
        "jabatan_baru": jabatanBaru,
        "kantor_lama": kantorLama,
        "kantor_baru": kantorBaru,
        "bukti_sk": buktiSk,
      };
}
