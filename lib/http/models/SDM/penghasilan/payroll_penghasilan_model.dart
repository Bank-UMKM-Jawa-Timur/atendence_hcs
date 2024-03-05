import 'dart:convert';

PayrollPenghasilanModel payrollPenghasilanModelFromJson(String str) =>
    PayrollPenghasilanModel.fromJson(json.decode(str));

String payrollPenghasilanModelToJson(PayrollPenghasilanModel data) =>
    json.encode(data.toJson());

class PayrollPenghasilanModel {
  int status;
  String message;
  Data data;

  PayrollPenghasilanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PayrollPenghasilanModel.fromJson(Map<String, dynamic> json) =>
      PayrollPenghasilanModel(
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
  int gaji;
  String? noRekening;
  int bpjsTk;
  int dpp;
  int kreditKoperasi;
  int iuranKoperasi;
  int kreditPegawai;
  int iuranIk;
  int totalPotongan;
  int totalYgDiterima;

  Data({
    required this.namaKaryawan,
    required this.gaji,
    required this.noRekening,
    required this.bpjsTk,
    required this.dpp,
    required this.kreditKoperasi,
    required this.iuranKoperasi,
    required this.kreditPegawai,
    required this.iuranIk,
    required this.totalPotongan,
    required this.totalYgDiterima,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaKaryawan: json["nama_karyawan"],
        gaji: json["gaji"],
        noRekening: json["no_rekening"],
        bpjsTk: json["bpjs_tk"],
        dpp: json["dpp"],
        kreditKoperasi: json["kredit_koperasi"],
        iuranKoperasi: json["iuran_koperasi"],
        kreditPegawai: json["kredit_pegawai"],
        iuranIk: json["iuran_ik"],
        totalPotongan: json["total_potongan"],
        totalYgDiterima: json["total_yg_diterima"],
      );

  Map<String, dynamic> toJson() => {
        "nama_karyawan": namaKaryawan,
        "gaji": gaji,
        "no_rekening": noRekening,
        "bpjs_tk": bpjsTk,
        "dpp": dpp,
        "kredit_koperasi": kreditKoperasi,
        "iuran_koperasi": iuranKoperasi,
        "kredit_pegawai": kreditPegawai,
        "iuran_ik": iuranIk,
        "total_potongan": totalPotongan,
        "total_yg_diterima": totalYgDiterima,
      };
}
