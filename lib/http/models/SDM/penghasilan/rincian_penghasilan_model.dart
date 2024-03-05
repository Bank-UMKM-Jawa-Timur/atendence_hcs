import 'dart:convert';

RincianPenghasilanModel rincianPenghasilanModelFromJson(String str) =>
    RincianPenghasilanModel.fromJson(json.decode(str));

String rincianPenghasilanModelToJson(RincianPenghasilanModel data) =>
    json.encode(data.toJson());

class RincianPenghasilanModel {
  int status;
  String message;
  Data data;

  RincianPenghasilanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RincianPenghasilanModel.fromJson(Map<String, dynamic> json) =>
      RincianPenghasilanModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String namaKaryawan;
  int gajiPokok;
  int tjKeluarga;
  int tjListrik;
  int tjJabatan;
  int tjKhusus;
  int tjPerumahan;
  int tjPelaksana;
  int tjKemahalan;
  int tjKesejahteraan;
  int tjTeller;
  int penyesuaian;
  int totalGaji;
  int pph21;

  Data({
    required this.namaKaryawan,
    required this.gajiPokok,
    required this.tjKeluarga,
    required this.tjListrik,
    required this.tjJabatan,
    required this.tjKhusus,
    required this.tjPerumahan,
    required this.tjPelaksana,
    required this.tjKemahalan,
    required this.tjKesejahteraan,
    required this.tjTeller,
    required this.penyesuaian,
    required this.totalGaji,
    required this.pph21,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaKaryawan: json["nama_karyawan"],
        gajiPokok: json["gaji_pokok"],
        tjKeluarga: json["tj_keluarga"],
        tjListrik: json["tj_listrik"],
        tjJabatan: json["tj_jabatan"],
        tjKhusus: json["tj_khusus"],
        tjPerumahan: json["tj_perumahan"],
        tjPelaksana: json["tj_pelaksana"],
        tjKemahalan: json["tj_kemahalan"],
        tjKesejahteraan: json["tj_kesejahteraan"],
        tjTeller: json["tj_teller"],
        penyesuaian: json["penyesuaian"],
        totalGaji: json["total_gaji"],
        pph21: json["pph21"],
      );

  Map<String, dynamic> toJson() => {
        "nama_karyawan": namaKaryawan,
        "gaji_pokok": gajiPokok,
        "tj_keluarga": tjKeluarga,
        "tj_listrik": tjListrik,
        "tj_jabatan": tjJabatan,
        "tj_khusus": tjKhusus,
        "tj_perumahan": tjPerumahan,
        "tj_pelaksana": tjPelaksana,
        "tj_kemahalan": tjKemahalan,
        "tj_kesejahteraan": tjKesejahteraan,
        "tj_teller": tjTeller,
        "penyesuaian": penyesuaian,
        "total_gaji": totalGaji,
        "pph21": pph21,
      };
}
