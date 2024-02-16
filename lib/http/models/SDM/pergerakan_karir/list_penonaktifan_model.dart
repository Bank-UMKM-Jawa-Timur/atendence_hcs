import 'dart:convert';

ListPenonaktifanModel listPenonaktifanModelFromJson(String str) =>
    ListPenonaktifanModel.fromJson(json.decode(str));

String listPenonaktifanModelToJson(ListPenonaktifanModel data) =>
    json.encode(data.toJson());

class ListPenonaktifanModel {
  int status;
  String message;
  List<Datum> data;

  ListPenonaktifanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ListPenonaktifanModel.fromJson(Map<String, dynamic> json) =>
      ListPenonaktifanModel(
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
  String kdBagian;
  String kdJabatan;
  String kdEntitas;
  DateTime tanggalPenonaktifan;
  String statusJabatan;
  dynamic ketJabatan;
  String jk;
  DateTime tanggalPengangkat;
  DateTime tglMulai;
  String noRekening;
  String kategoriPenonaktifan;
  String namaJabatan;
  String namaBagian;
  String namaCabang;
  String displayJabatan;

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
    required this.kategoriPenonaktifan,
    required this.namaJabatan,
    required this.namaBagian,
    required this.namaCabang,
    required this.displayJabatan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["nip"],
        nik: json["nik"],
        namaKaryawan: json["nama_karyawan"],
        kdBagian: json["kd_bagian"],
        kdJabatan: json["kd_jabatan"],
        kdEntitas: json["kd_entitas"],
        tanggalPenonaktifan: DateTime.parse(json["tanggal_penonaktifan"]),
        statusJabatan: json["status_jabatan"],
        ketJabatan: json["ket_jabatan"],
        jk: json["jk"],
        tanggalPengangkat: DateTime.parse(json["tanggal_pengangkat"]),
        tglMulai: DateTime.parse(json["tgl_mulai"]),
        noRekening: json["no_rekening"],
        kategoriPenonaktifan: json["kategori_penonaktifan"],
        namaJabatan: json["nama_jabatan"],
        namaBagian: json["nama_bagian"],
        namaCabang: json["nama_cabang"],
        displayJabatan: json["display_jabatan"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nik": nik,
        "nama_karyawan": namaKaryawan,
        "kd_bagian": kdBagian,
        "kd_jabatan": kdJabatan,
        "kd_entitas": kdEntitas,
        "tanggal_penonaktifan":
            "${tanggalPenonaktifan.year.toString().padLeft(4, '0')}-${tanggalPenonaktifan.month.toString().padLeft(2, '0')}-${tanggalPenonaktifan.day.toString().padLeft(2, '0')}",
        "status_jabatan": statusJabatan,
        "ket_jabatan": ketJabatan,
        "jk": jk,
        "tanggal_pengangkat":
            "${tanggalPengangkat.year.toString().padLeft(4, '0')}-${tanggalPengangkat.month.toString().padLeft(2, '0')}-${tanggalPengangkat.day.toString().padLeft(2, '0')}",
        "tgl_mulai":
            "${tglMulai.year.toString().padLeft(4, '0')}-${tglMulai.month.toString().padLeft(2, '0')}-${tglMulai.day.toString().padLeft(2, '0')}",
        "no_rekening": noRekening,
        "kategori_penonaktifan": kategoriPenonaktifan,
        "nama_jabatan": namaJabatan,
        "nama_bagian": namaBagian,
        "nama_cabang": namaCabang,
        "display_jabatan": displayJabatan,
      };
}
