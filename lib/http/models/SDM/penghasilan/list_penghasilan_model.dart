import 'dart:convert';

ListPenghasilanModel listPenghasilanModelFromJson(String str) =>
    ListPenghasilanModel.fromJson(json.decode(str));

String listPenghasilanModelToJson(ListPenghasilanModel data) =>
    json.encode(data.toJson());

class ListPenghasilanModel {
  String status;
  String message;
  List<Datum> data;

  ListPenghasilanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ListPenghasilanModel.fromJson(Map<String, dynamic> json) =>
      ListPenghasilanModel(
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
  String? kategori;
  String? kantor;
  String tahun;
  String bulan;
  DateTime tanggal;
  int bruto;
  int totalPotongan;
  int netto;
  int totalPph;
  int totalPajakInsentif;
  int hasilPph;

  Datum({
    required this.id,
    required this.kategori,
    required this.kantor,
    required this.tahun,
    required this.bulan,
    required this.tanggal,
    required this.bruto,
    required this.totalPotongan,
    required this.netto,
    required this.totalPph,
    required this.totalPajakInsentif,
    required this.hasilPph,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        kategori: json["kategori"],
        kantor: json["kantor"],
        tahun: json["tahun"],
        bulan: json["bulan"],
        tanggal: DateTime.parse(json["tanggal"]),
        bruto: json["bruto"],
        totalPotongan: json["total_potongan"],
        netto: json["netto"],
        totalPph: json["total_pph"],
        totalPajakInsentif: json["total_pajak_insentif"],
        hasilPph: json["hasil_pph"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "kantor": kantor,
        "tahun": tahun,
        "bulan": bulan,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "bruto": bruto,
        "total_potongan": totalPotongan,
        "netto": netto,
        "total_pph": totalPph,
        "total_pajak_insentif": totalPajakInsentif,
        "hasil_pph": hasilPph,
      };
}
