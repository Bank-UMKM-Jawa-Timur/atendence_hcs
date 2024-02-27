import 'dart:convert';

LaporanPromosiModel laporanPromosiModelFromJson(String str) =>
    LaporanPromosiModel.fromJson(json.decode(str));

String laporanPromosiModelToJson(LaporanPromosiModel data) =>
    json.encode(data.toJson());

class LaporanPromosiModel {
  int status;
  String message;
  List<Datum> data;

  LaporanPromosiModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LaporanPromosiModel.fromJson(Map<String, dynamic> json) =>
      LaporanPromosiModel(
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
  JabatanBaru jabatanBaru;
  String kantorLama;
  String kantorBaru;
  BuktiSk buktiSk;

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
        jabatanBaru: jabatanBaruValues.map[json["jabatan_baru"]]!,
        kantorLama: json["kantor_lama"],
        kantorBaru: json["kantor_baru"],
        buktiSk: buktiSkValues.map[json["bukti_sk"]]!,
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "tanggal_pengesahan":
            tanggalPengesahanValues.reverse[tanggalPengesahan],
        "jabatan_lama": jabatanLama,
        "jabatan_baru": jabatanBaruValues.reverse[jabatanBaru],
        "kantor_lama": kantorLama,
        "kantor_baru": kantorBaru,
        "bukti_sk": buktiSkValues.reverse[buktiSk],
      };
}

enum BuktiSk {
  THE_004_KEP_DIR_UM_2024,
  THE_013_KEP_DIR_UM_2024,
  THE_254_KEP_DIR_UM_2023
}

final buktiSkValues = EnumValues({
  "004/KEP/DIR.Um/2024": BuktiSk.THE_004_KEP_DIR_UM_2024,
  "013/KEP/DIR.Um/2024": BuktiSk.THE_013_KEP_DIR_UM_2024,
  "254/KEP/DIR.Um/2023": BuktiSk.THE_254_KEP_DIR_UM_2023
});

enum JabatanBaru { DEFINITIF_PENYELIA, DEFINITIF_STAF, PENJABAT_PENYELIA }

final jabatanBaruValues = EnumValues({
  "Definitif - Penyelia": JabatanBaru.DEFINITIF_PENYELIA,
  "Definitif - Staf": JabatanBaru.DEFINITIF_STAF,
  "Penjabat - Penyelia": JabatanBaru.PENJABAT_PENYELIA
});

enum TanggalPengesahan {
  THE_03_JANUARY_2024,
  THE_22_JANUARY_2024,
  THE_29_DECEMBER_2023
}

final tanggalPengesahanValues = EnumValues({
  "03 January 2024": TanggalPengesahan.THE_03_JANUARY_2024,
  "22 January 2024": TanggalPengesahan.THE_22_JANUARY_2024,
  "29 December 2023": TanggalPengesahan.THE_29_DECEMBER_2023
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
