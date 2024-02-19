import 'dart:convert';

HistoriJabatanModel historiJabatanModelFromJson(String str) =>
    HistoriJabatanModel.fromJson(json.decode(str));

String historiJabatanModelToJson(HistoriJabatanModel data) =>
    json.encode(data.toJson());

class HistoriJabatanModel {
  int status;
  String message;
  List<Datum> data;

  HistoriJabatanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoriJabatanModel.fromJson(Map<String, dynamic> json) =>
      HistoriJabatanModel(
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
  DateTime tanggalPengesahan;
  String? lama;
  String? baru;
  String? buktiSk;
  Keterangan keterangan;
  String? masaKerja;

  Datum({
    required this.tanggalPengesahan,
    required this.lama,
    required this.baru,
    required this.buktiSk,
    required this.keterangan,
    required this.masaKerja,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tanggalPengesahan: DateTime.parse(json["tanggal_pengesahan"]),
        lama: json["lama"],
        baru: json["baru"],
        buktiSk: json["bukti_sk"],
        keterangan: keteranganValues.map[json["keterangan"]]!,
        masaKerja: json["masa_kerja"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal_pengesahan":
            "${tanggalPengesahan.year.toString().padLeft(4, '0')}-${tanggalPengesahan.month.toString().padLeft(2, '0')}-${tanggalPengesahan.day.toString().padLeft(2, '0')}",
        "lama": lama,
        "baru": baru,
        "bukti_sk": buktiSk,
        "keterangan": keteranganValues.reverse[keterangan],
        "masa_kerja": masaKerja,
      };
}

enum Keterangan { EMPTY, MUTASI, PROMOSI }

final keteranganValues = EnumValues({
  "-": Keterangan.EMPTY,
  "Mutasi": Keterangan.MUTASI,
  "Promosi": Keterangan.PROMOSI
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
