import 'dart:convert';

DetailPenghasilanModel detailPenghasilanModelFromJson(String str) =>
    DetailPenghasilanModel.fromJson(json.decode(str));

String detailPenghasilanModelToJson(DetailPenghasilanModel data) =>
    json.encode(data.toJson());

class DetailPenghasilanModel {
  int status;
  String message;
  List<Datum> data;

  DetailPenghasilanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DetailPenghasilanModel.fromJson(Map<String, dynamic> json) =>
      DetailPenghasilanModel(
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
  String namaKaryawan;
  String bulan;
  String tahun;
  int dpp;
  int jp;
  int bpjsTk;
  int penambahBrutoJamsostek;
  int totalPajakInsentif;
  int hasilPph;
  int bruto;
  int totalPotongan;
  int netto;

  Datum({
    required this.nip,
    required this.namaKaryawan,
    required this.bulan,
    required this.tahun,
    required this.dpp,
    required this.jp,
    required this.bpjsTk,
    required this.penambahBrutoJamsostek,
    required this.totalPajakInsentif,
    required this.hasilPph,
    required this.bruto,
    required this.totalPotongan,
    required this.netto,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        bulan: json["bulan"],
        tahun: json["tahun"],
        dpp: json["dpp"],
        jp: json["jp"],
        bpjsTk: json["bpjs_tk"],
        penambahBrutoJamsostek: json["penambah_bruto_jamsostek"],
        totalPajakInsentif: json["total_pajak_insentif"],
        hasilPph: json["hasil_pph"],
        bruto: json["bruto"],
        totalPotongan: json["total_potongan"],
        netto: json["netto"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "bulan": bulan,
        "tahun": tahun,
        "dpp": dpp,
        "jp": jp,
        "bpjs_tk": bpjsTk,
        "penambah_bruto_jamsostek": penambahBrutoJamsostek,
        "total_pajak_insentif": totalPajakInsentif,
        "hasil_pph": hasilPph,
        "bruto": bruto,
        "total_potongan": totalPotongan,
        "netto": netto,
      };
}
