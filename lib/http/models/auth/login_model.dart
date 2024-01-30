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
  String nip;
  String namaKaryawan;
  String jenisKelamin;
  Entitas entitas;
  String displayJabatan;

  Data({
    required this.nip,
    required this.namaKaryawan,
    required this.jenisKelamin,
    required this.entitas,
    required this.displayJabatan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        jenisKelamin: json["jenis_kelamin"],
        entitas: Entitas.fromJson(json["entitas"]),
        displayJabatan: json["display_jabatan"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "jenis_kelamin": jenisKelamin,
        "entitas": entitas.toJson(),
        "display_jabatan": displayJabatan,
      };
}

class Entitas {
  int type;

  Entitas({
    required this.type,
  });

  factory Entitas.fromJson(Map<String, dynamic> json) => Entitas(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}
