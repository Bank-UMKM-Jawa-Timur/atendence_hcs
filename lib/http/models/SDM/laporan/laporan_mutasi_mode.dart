import 'dart:convert';

LaporanMutasiModel laporanMutasiModelFromJson(String str) =>
    LaporanMutasiModel.fromJson(json.decode(str));

String laporanMutasiModelToJson(LaporanMutasiModel data) =>
    json.encode(data.toJson());

class LaporanMutasiModel {
  int status;
  String message;
  List<Datum> data;

  LaporanMutasiModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LaporanMutasiModel.fromJson(Map<String, dynamic> json) =>
      LaporanMutasiModel(
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
  TanggalPengesahan tanggalPengesahan;
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
        tanggalPengesahan:
            tanggalPengesahanValues.map[json["tanggal_pengesahan"]]!,
        jabatanLama: json["jabatan_lama"],
        jabatanBaru: json["jabatan_baru"],
        kantorLama: json["kantor_lama"],
        kantorBaru: json["kantor_baru"],
        buktiSk: json["bukti_sk"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "tanggal_pengesahan":
            tanggalPengesahanValues.reverse[tanggalPengesahan],
        "jabatan_lama": jabatanLama,
        "jabatan_baru": jabatanBaru,
        "kantor_lama": kantorLama,
        "kantor_baru": kantorBaru,
        "bukti_sk": buktiSk,
      };
}

enum TanggalPengesahan { THE_13_NOVEMBER_2023 }

final tanggalPengesahanValues =
    EnumValues({"13 November 2023": TanggalPengesahan.THE_13_NOVEMBER_2023});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
