import 'dart:convert';

DataMasaPensiunModel dataMasaPensiunModelFromJson(String str) =>
    DataMasaPensiunModel.fromJson(json.decode(str));

String dataMasaPensiunModelToJson(DataMasaPensiunModel data) =>
    json.encode(data.toJson());

class DataMasaPensiunModel {
  int status;
  String message;
  List<Datum> data;

  DataMasaPensiunModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DataMasaPensiunModel.fromJson(Map<String, dynamic> json) =>
      DataMasaPensiunModel(
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
  String nik;
  String namaKaryawan;
  String? kdBagian;
  String? kdJabatan;
  String? kdEntitas;
  String? tanggalPenonaktifan;
  String? statusJabatan;
  String? ketJabatan;
  String? jk;
  DateTime tanggalPengangkat;
  DateTime tglMulai;
  String? noRekening;
  String? namaJabatan;
  String? namaBagian;
  String? namaCabang;
  DateTime tglLahir;
  String? displayJabatan;
  String? pensiun;
  String? kantor;

  Datum({
    required this.nip,
    required this.nik,
    required this.namaKaryawan,
    required this.kdBagian,
    required this.kdJabatan,
    required this.kdEntitas,
    required this.tanggalPenonaktifan,
    required this.statusJabatan,
    required this.ketJabatan,
    required this.jk,
    required this.tanggalPengangkat,
    required this.tglMulai,
    required this.noRekening,
    required this.namaJabatan,
    required this.namaBagian,
    required this.namaCabang,
    required this.tglLahir,
    required this.displayJabatan,
    required this.pensiun,
    required this.kantor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["nip"],
        nik: json["nik"],
        namaKaryawan: json["nama_karyawan"],
        kdBagian: json["kd_bagian"],
        kdJabatan: json["kd_jabatan"],
        kdEntitas: json["kd_entitas"],
        tanggalPenonaktifan: json["tanggal_penonaktifan"],
        statusJabatan: json["status_jabatan"],
        ketJabatan: json["ket_jabatan"],
        jk: json["jk"],
        tanggalPengangkat: DateTime.parse(json["tanggal_pengangkat"]),
        tglMulai: DateTime.parse(json["tgl_mulai"]),
        noRekening: json["no_rekening"],
        namaJabatan: json["nama_jabatan"],
        namaBagian: json["nama_bagian"],
        namaCabang: json["nama_cabang"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        displayJabatan: json["display_jabatan"],
        pensiun: json["pensiun"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nik": nik,
        "nama_karyawan": namaKaryawan,
        "kd_bagian": kdBagian,
        "kd_jabatan": kdJabatan,
        "kd_entitas": kdEntitas,
        "tanggal_penonaktifan": tanggalPenonaktifan,
        "status_jabatan": statusJabatan,
        "ket_jabatan": ketJabatan,
        "jk": jk,
        "tanggal_pengangkat":
            "${tanggalPengangkat.year.toString().padLeft(4, '0')}-${tanggalPengangkat.month.toString().padLeft(2, '0')}-${tanggalPengangkat.day.toString().padLeft(2, '0')}",
        "tgl_mulai":
            "${tglMulai.year.toString().padLeft(4, '0')}-${tglMulai.month.toString().padLeft(2, '0')}-${tglMulai.day.toString().padLeft(2, '0')}",
        "no_rekening": noRekening,
        "nama_jabatan": namaJabatan,
        "nama_bagian": namaBagian,
        "nama_cabang": namaCabang,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "display_jabatan": displayJabatan,
        "pensiun": pensiun,
        "kantor": kantor,
      };
}
