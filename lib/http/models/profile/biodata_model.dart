import 'dart:convert';

BiodataModel biodataModelFromJson(String str) =>
    BiodataModel.fromJson(json.decode(str));

String biodataModelToJson(BiodataModel data) => json.encode(data.toJson());

class BiodataModel {
  int status;
  String message;
  Data data;

  BiodataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BiodataModel.fromJson(Map<String, dynamic> json) => BiodataModel(
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
  Biodata biodata;
  NorekNpwp norekNpwp;
  DataJabatan dataJabatan;

  Data({
    required this.biodata,
    required this.norekNpwp,
    required this.dataJabatan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        biodata: Biodata.fromJson(json["biodata"]),
        norekNpwp: NorekNpwp.fromJson(json["norek_npwp"]),
        dataJabatan: DataJabatan.fromJson(json["data_jabatan"]),
      );

  Map<String, dynamic> toJson() => {
        "biodata": biodata.toJson(),
        "norek_npwp": norekNpwp.toJson(),
        "data_jabatan": dataJabatan.toJson(),
      };
}

class Biodata {
  String? nip;
  String? nik;
  String? namaKaryawan;
  String? ttl;
  String? umur;
  String? agama;
  String? statusPernikahan;
  String? kewarganegaraan;
  String? alamatKtp;
  String? alamatSek;
  String? jenisKelamin;

  Biodata({
    required this.nip,
    required this.nik,
    required this.namaKaryawan,
    required this.ttl,
    required this.umur,
    required this.agama,
    required this.statusPernikahan,
    required this.kewarganegaraan,
    required this.alamatKtp,
    required this.alamatSek,
    required this.jenisKelamin,
  });

  factory Biodata.fromJson(Map<String, dynamic> json) => Biodata(
        nip: json["nip"],
        nik: json["nik"],
        namaKaryawan: json["nama_karyawan"],
        ttl: json["ttl"],
        umur: json["umur"],
        agama: json["agama"],
        statusPernikahan: json["status_pernikahan"],
        kewarganegaraan: json["kewarganegaraan"],
        alamatKtp: json["alamat_ktp"],
        alamatSek: json["alamat_sek"],
        jenisKelamin: json["jenis_kelamin"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nik": nik,
        "nama_karyawan": namaKaryawan,
        "ttl": ttl,
        "umur": umur,
        "agama": agama,
        "status_pernikahan": statusPernikahan,
        "kewarganegaraan": kewarganegaraan,
        "alamat_ktp": alamatKtp,
        "alamat_sek": alamatSek,
        "jenis_kelamin": jenisKelamin,
      };
}

class DataJabatan {
  String? tanggalBergabung;
  String? lamaKerja;
  String? pangkat;
  String? golongan;
  String? statusKaryawan;
  String? statusJabatan;
  String? keteranganJabatan;
  String? tanggalMulai;
  String? pendidikanTerakhir;
  String? pendidikanMajor;
  String? skPengangkatan;
  DateTime tanggalPengangkatan;
  String displayJabatan;

  DataJabatan({
    required this.tanggalBergabung,
    required this.lamaKerja,
    required this.pangkat,
    required this.golongan,
    required this.statusKaryawan,
    required this.statusJabatan,
    required this.keteranganJabatan,
    required this.tanggalMulai,
    required this.pendidikanTerakhir,
    required this.pendidikanMajor,
    required this.skPengangkatan,
    required this.tanggalPengangkatan,
    required this.displayJabatan,
  });

  factory DataJabatan.fromJson(Map<String, dynamic> json) => DataJabatan(
        tanggalBergabung: json["tanggal_bergabung"],
        lamaKerja: json["lama_kerja"],
        pangkat: json["pangkat"],
        golongan: json["golongan"],
        statusKaryawan: json["status_karyawan"],
        statusJabatan: json["status_jabatan"],
        keteranganJabatan: json["keterangan_jabatan"],
        tanggalMulai: json["tanggal_mulai"],
        pendidikanTerakhir: json["pendidikan_terakhir"],
        pendidikanMajor: json["pendidikan_major"],
        skPengangkatan: json["sk_pengangkatan"],
        tanggalPengangkatan: DateTime.parse(json["tanggal_pengangkatan"]),
        displayJabatan: json["display_jabatan"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal_bergabung": tanggalBergabung,
        "lama_kerja": lamaKerja,
        "pangkat": pangkat,
        "golongan": golongan,
        "status_karyawan": statusKaryawan,
        "status_jabatan": statusJabatan,
        "keterangan_jabatan": keteranganJabatan,
        "tanggal_mulai": tanggalMulai,
        "pendidikan_terakhir": pendidikanTerakhir,
        "pendidikan_major": pendidikanMajor,
        "sk_pengangkatan": skPengangkatan,
        "tanggal_pengangkatan":
            "${tanggalPengangkatan.year.toString().padLeft(4, '0')}-${tanggalPengangkatan.month.toString().padLeft(2, '0')}-${tanggalPengangkatan.day.toString().padLeft(2, '0')}",
        "display_jabatan": displayJabatan,
      };
}

class NorekNpwp {
  String? noRek;
  String npwp;

  NorekNpwp({
    required this.noRek,
    required this.npwp,
  });

  factory NorekNpwp.fromJson(Map<String, dynamic> json) => NorekNpwp(
        noRek: json["no_rek"],
        npwp: json["npwp"],
      );

  Map<String, dynamic> toJson() => {
        "no_rek": noRek,
        "npwp": npwp,
      };
}
