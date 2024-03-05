// To parse this JSON data, do
//
//     final detailRekapTetapModel = detailRekapTetapModelFromJson(jsonString);

import 'dart:convert';

DetailRekapTetapModel detailRekapTetapModelFromJson(String str) =>
    DetailRekapTetapModel.fromJson(json.decode(str));

String detailRekapTetapModelToJson(DetailRekapTetapModel data) =>
    json.encode(data.toJson());

class DetailRekapTetapModel {
  String nip;
  int status;
  String message;
  List<Datum> data;

  DetailRekapTetapModel({
    required this.nip,
    required this.status,
    required this.message,
    required this.data,
  });

  factory DetailRekapTetapModel.fromJson(Map<String, dynamic> json) =>
      DetailRekapTetapModel(
        nip: json["nip"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String namaKaryawan;
  String nip;
  String npwp;
  String ptkp;
  int bruto;
  int totalGaji;
  Teratur teratur;
  Map<String, int> tidakTeratur;
  List<Bonus> bonus;
  int penambahBruto;
  int pph21Bentukan;
  List<PajakInsentif> pajakInsentif;
  int pph21;

  Datum({
    required this.namaKaryawan,
    required this.nip,
    required this.npwp,
    required this.ptkp,
    required this.bruto,
    required this.totalGaji,
    required this.teratur,
    required this.tidakTeratur,
    required this.bonus,
    required this.penambahBruto,
    required this.pph21Bentukan,
    required this.pajakInsentif,
    required this.pph21,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaKaryawan: json["nama_karyawan"],
        nip: json["nip"],
        npwp: json["npwp"],
        ptkp: json["ptkp"],
        bruto: json["bruto"],
        totalGaji: json["total_gaji"],
        teratur: Teratur.fromJson(json["teratur"]),
        tidakTeratur: Map.from(json["tidak_teratur"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        bonus: List<Bonus>.from(json["bonus"].map((x) => Bonus.fromJson(x))),
        penambahBruto: json["penambahBruto"],
        pph21Bentukan: json["pph21Bentukan"],
        pajakInsentif: List<PajakInsentif>.from(
            json["pajak_insentif"].map((x) => PajakInsentif.fromJson(x))),
        pph21: json["pph21"],
      );

  Map<String, dynamic> toJson() => {
        "nama_karyawan": namaKaryawan,
        "nip": nip,
        "npwp": npwp,
        "ptkp": ptkp,
        "bruto": bruto,
        "total_gaji": totalGaji,
        "teratur": teratur.toJson(),
        "tidak_teratur": Map.from(tidakTeratur)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "bonus": List<dynamic>.from(bonus.map((x) => x.toJson())),
        "penambahBruto": penambahBruto,
        "pph21Bentukan": pph21Bentukan,
        "pajak_insentif":
            List<dynamic>.from(pajakInsentif.map((x) => x.toJson())),
        "pph21": pph21,
      };
}

class Bonus {
  int brutoThr;
  int brutoDanaPendidikan;
  int brutoPenghargaanKinerja;
  int brutoNataru;
  int brutoJaspro;
  int tambahanPenghasilan;
  int rekreasi;

  Bonus({
    required this.brutoThr,
    required this.brutoDanaPendidikan,
    required this.brutoPenghargaanKinerja,
    required this.brutoNataru,
    required this.brutoJaspro,
    required this.tambahanPenghasilan,
    required this.rekreasi,
  });

  factory Bonus.fromJson(Map<String, dynamic> json) => Bonus(
        brutoThr: json["brutoTHR"],
        brutoDanaPendidikan: json["brutoDanaPendidikan"],
        brutoPenghargaanKinerja: json["brutoPenghargaanKinerja"],
        brutoNataru: json["brutoNataru"],
        brutoJaspro: json["brutoJaspro"],
        tambahanPenghasilan: json["tambahanPenghasilan"],
        rekreasi: json["rekreasi"],
      );

  Map<String, dynamic> toJson() => {
        "brutoTHR": brutoThr,
        "brutoDanaPendidikan": brutoDanaPendidikan,
        "brutoPenghargaanKinerja": brutoPenghargaanKinerja,
        "brutoNataru": brutoNataru,
        "brutoJaspro": brutoJaspro,
        "tambahanPenghasilan": tambahanPenghasilan,
        "rekreasi": rekreasi,
      };
}

class PajakInsentif {
  int kredit;
  int penagihan;
  int total;

  PajakInsentif({
    required this.kredit,
    required this.penagihan,
    required this.total,
  });

  factory PajakInsentif.fromJson(Map<String, dynamic> json) => PajakInsentif(
        kredit: json["kredit"],
        penagihan: json["penagihan"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "kredit": kredit,
        "penagihan": penagihan,
        "total": total,
      };
}

class Teratur {
  int uangMakan;
  int tjPulsa;
  int tjVitamin;
  int tjTransport;

  Teratur({
    required this.uangMakan,
    required this.tjPulsa,
    required this.tjVitamin,
    required this.tjTransport,
  });

  factory Teratur.fromJson(Map<String, dynamic> json) => Teratur(
        uangMakan: json["uang_makan"],
        tjPulsa: json["tj_pulsa"],
        tjVitamin: json["tj_vitamin"],
        tjTransport: json["tj_transport"],
      );

  Map<String, dynamic> toJson() => {
        "uang_makan": uangMakan,
        "tj_pulsa": tjPulsa,
        "tj_vitamin": tjVitamin,
        "tj_transport": tjTransport,
      };
}
