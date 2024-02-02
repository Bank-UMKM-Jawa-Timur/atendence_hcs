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
  String tanggalBergabung;
  String lamaKerja;
  String noRekening;
  Entitas entitas;
  String displayJabatan;

  Data({
    required this.nip,
    required this.namaKaryawan,
    required this.jenisKelamin,
    required this.tanggalBergabung,
    required this.lamaKerja,
    required this.noRekening,
    required this.entitas,
    required this.displayJabatan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        jenisKelamin: json["jenis_kelamin"],
        tanggalBergabung: json["tanggal_bergabung"],
        lamaKerja: json["lama_kerja"],
        noRekening: json["no_rekening"],
        entitas: Entitas.fromJson(json["entitas"]),
        displayJabatan: json["display_jabatan"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "jenis_kelamin": jenisKelamin,
        "tanggal_bergabung": tanggalBergabung,
        "lama_kerja": lamaKerja,
        "no_rekening": noRekening,
        "entitas": entitas.toJson(),
        "display_jabatan": displayJabatan,
      };
}

class Entitas {
  int type;
  SubDiv subDiv;
  Div div;

  Entitas({
    required this.type,
    required this.subDiv,
    required this.div,
  });

  factory Entitas.fromJson(Map<String, dynamic> json) => Entitas(
        type: json["type"],
        subDiv: SubDiv.fromJson(json["subDiv"]),
        div: Div.fromJson(json["div"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "subDiv": subDiv.toJson(),
        "div": div.toJson(),
      };
}

class Div {
  String kdDivisi;
  String namaDivisi;
  int idKantor;
  DateTime createdAt;
  dynamic updatedAt;

  Div({
    required this.kdDivisi,
    required this.namaDivisi,
    required this.idKantor,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Div.fromJson(Map<String, dynamic> json) => Div(
        kdDivisi: json["kd_divisi"],
        namaDivisi: json["nama_divisi"],
        idKantor: json["id_kantor"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "kd_divisi": kdDivisi,
        "nama_divisi": namaDivisi,
        "id_kantor": idKantor,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}

class SubDiv {
  String kdSubdiv;
  String namaSubdivisi;
  String kdDivisi;
  DateTime createdAt;
  dynamic updatedAt;

  SubDiv({
    required this.kdSubdiv,
    required this.namaSubdivisi,
    required this.kdDivisi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubDiv.fromJson(Map<String, dynamic> json) => SubDiv(
        kdSubdiv: json["kd_subdiv"],
        namaSubdivisi: json["nama_subdivisi"],
        kdDivisi: json["kd_divisi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "kd_subdiv": kdSubdiv,
        "nama_subdivisi": namaSubdivisi,
        "kd_divisi": kdDivisi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
