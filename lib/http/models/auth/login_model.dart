import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int status;
  String message;
  Data data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  String? nip;
  String? namaKaryawan;
  String? jenisKelamin;
  String? tanggalBergabung;
  String? lamaKerja;
  String? noRekening;
  String? displayJabatan;
  String? tipe;

  Data({
    required this.nip,
    required this.namaKaryawan,
    required this.jenisKelamin,
    required this.tanggalBergabung,
    required this.lamaKerja,
    required this.noRekening,
    required this.displayJabatan,
    required this.tipe,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        jenisKelamin: json["jenis_kelamin"],
        tanggalBergabung: json["tanggal_bergabung"],
        lamaKerja: json["lama_kerja"],
        noRekening: json["no_rekening"],
        displayJabatan: json["display_jabatan"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "jenis_kelamin": jenisKelamin,
        "tanggal_bergabung": tanggalBergabung,
        "lama_kerja": lamaKerja,
        "no_rekening": noRekening,
        "display_jabatan": displayJabatan,
        "tipe": tipe,
      };
}
