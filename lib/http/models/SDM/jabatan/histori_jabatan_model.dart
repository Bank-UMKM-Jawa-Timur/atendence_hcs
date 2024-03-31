import 'dart:convert';

HistoriJabatanModel historiJabatanModelFromJson(String str) =>
    HistoriJabatanModel.fromJson(json.decode(str));

String historiJabatanModelToJson(HistoriJabatanModel data) =>
    json.encode(data.toJson());

class HistoriJabatanModel {
  int status;
  String message;
  Rincian rincian;
  List<Datum> data;

  HistoriJabatanModel({
    required this.status,
    required this.message,
    required this.rincian,
    required this.data,
  });

  factory HistoriJabatanModel.fromJson(Map<String, dynamic> json) =>
      HistoriJabatanModel(
        status: json["status"],
        message: json["message"],
        rincian: Rincian.fromJson(json["rincian"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "rincian": rincian.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  DateTime tanggalPengesahan;
  String lama;
  String baru;
  String buktiSk;
  Keterangan keterangan;
  String masaKerja;

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

class Rincian {
  String nip;
  String namaKaryawan;
  String jk;
  String statusJabatan;
  String namaJabatan;
  String pangkatGolongan;
  String? kantor;

  Rincian({
    required this.nip,
    required this.namaKaryawan,
    required this.jk,
    required this.statusJabatan,
    required this.namaJabatan,
    required this.pangkatGolongan,
    required this.kantor,
  });

  factory Rincian.fromJson(Map<String, dynamic> json) => Rincian(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        jk: json["jk"],
        statusJabatan: json["status_jabatan"],
        namaJabatan: json["nama_jabatan"],
        pangkatGolongan: json["pangkat_golongan"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "jk": jk,
        "status_jabatan": statusJabatan,
        "nama_jabatan": namaJabatan,
        "pangkat_golongan": pangkatGolongan,
        "kantor": kantor,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
