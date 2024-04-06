import 'dart:convert';

ListPengkinianDataModel listPengkinianDataModelFromJson(String str) =>
    ListPengkinianDataModel.fromJson(json.decode(str));

String listPengkinianDataModelToJson(ListPengkinianDataModel data) =>
    json.encode(data.toJson());

class ListPengkinianDataModel {
  int status;
  String message;
  List<Datum> data;

  ListPengkinianDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ListPengkinianDataModel.fromJson(Map<String, dynamic> json) =>
      ListPengkinianDataModel(
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
  String nik;
  String namaKaryawan;
  String? kdEntitas;
  String? kdJabatan;
  String? kdBagian;
  String? ketJabatan;
  String? statusKaryawan;
  String? namaJabatan;
  String? statusJabatan;
  String? namaBagian;
  int statusKantor;
  String? namaCabang;
  String? displayJabatan;
  String? kantor;

  Datum({
    required this.id,
    required this.nip,
    required this.nik,
    required this.namaKaryawan,
    required this.kdEntitas,
    required this.kdJabatan,
    required this.kdBagian,
    required this.ketJabatan,
    required this.statusKaryawan,
    required this.namaJabatan,
    required this.statusJabatan,
    required this.namaBagian,
    required this.statusKantor,
    required this.namaCabang,
    required this.displayJabatan,
    required this.kantor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nip: json["nip"],
        nik: json["nik"],
        namaKaryawan: json["nama_karyawan"],
        kdEntitas: json["kd_entitas"],
        kdJabatan: json["kd_jabatan"],
        kdBagian: json["kd_bagian"],
        ketJabatan: json["ket_jabatan"],
        statusKaryawan: json["status_karyawan"],
        namaJabatan: json["nama_jabatan"],
        statusJabatan: json["status_jabatan"],
        namaBagian: json["nama_bagian"],
        statusKantor: json["status_kantor"],
        namaCabang: json["nama_cabang"],
        displayJabatan: json["display_jabatan"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nik": nik,
        "nama_karyawan": namaKaryawan,
        "kd_entitas": kdEntitas,
        "kd_jabatan": kdJabatan,
        "kd_bagian": kdBagian,
        "ket_jabatan": ketJabatan,
        "status_karyawan": statusKaryawan,
        "nama_jabatan": namaJabatan,
        "status_jabatan": statusJabatan,
        "nama_bagian": namaBagian,
        "status_kantor": statusKantor,
        "nama_cabang": namaCabang,
        "display_jabatan": displayJabatan,
        "kantor": kantor,
      };
}
