import 'dart:convert';

ListPenghasilanModel listPenghasilanModelFromJson(String str) =>
    ListPenghasilanModel.fromJson(json.decode(str));

String listPenghasilanModelToJson(ListPenghasilanModel data) =>
    json.encode(data.toJson());

class ListPenghasilanModel {
  Status status;
  String message;
  List<Datum> data;

  ListPenghasilanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ListPenghasilanModel.fromJson(Map<String, dynamic> json) =>
      ListPenghasilanModel(
        status: statusValues.map[json["status"]]!,
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String kdEntitas;
  int isPegawai;
  String kantor;
  DateTime tanggalInput;
  DateTime tanggalFinal;
  DateTime tanggalCetak;
  DateTime tanggalUpload;
  String? file;
  Status status;
  String bulan;
  String tahun;
  int dpp;
  int jp;
  int bpjsTk;
  int penambahBrutoJamsostek;
  int totalPph;
  int totalPajakInsentif;
  int hasilPph;
  int bruto;
  int totalPotongan;
  int netto;
  String entitasKaryawan;
  String? namaDivisi;
  int totalPenyesuaian;

  Datum({
    required this.id,
    required this.kdEntitas,
    required this.isPegawai,
    required this.kantor,
    required this.tanggalInput,
    required this.tanggalFinal,
    required this.tanggalCetak,
    required this.tanggalUpload,
    required this.file,
    required this.status,
    required this.bulan,
    required this.tahun,
    required this.dpp,
    required this.jp,
    required this.bpjsTk,
    required this.penambahBrutoJamsostek,
    required this.totalPph,
    required this.totalPajakInsentif,
    required this.hasilPph,
    required this.bruto,
    required this.totalPotongan,
    required this.netto,
    required this.entitasKaryawan,
    required this.namaDivisi,
    required this.totalPenyesuaian,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        kdEntitas: json["kd_entitas"],
        isPegawai: json["is_pegawai"],
        kantor: json["kantor"],
        tanggalInput: DateTime.parse(json["tanggal_input"]),
        tanggalFinal: DateTime.parse(json["tanggal_final"]),
        tanggalCetak: DateTime.parse(json["tanggal_cetak"]),
        tanggalUpload: DateTime.parse(json["tanggal_upload"]),
        file: json["file"],
        status: statusValues.map[json["status"]]!,
        bulan: json["bulan"],
        tahun: json["tahun"],
        dpp: json["dpp"],
        jp: json["jp"],
        bpjsTk: json["bpjs_tk"],
        penambahBrutoJamsostek: json["penambah_bruto_jamsostek"],
        totalPph: json["total_pph"],
        totalPajakInsentif: json["total_pajak_insentif"],
        hasilPph: json["hasil_pph"],
        bruto: json["bruto"],
        totalPotongan: json["total_potongan"],
        netto: json["netto"],
        entitasKaryawan: json["entitas_karyawan"],
        namaDivisi: json["nama_divisi"],
        totalPenyesuaian: json["total_penyesuaian"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kd_entitas": kdEntitas,
        "is_pegawai": isPegawai,
        "kantor": kantor,
        "tanggal_input":
            "${tanggalInput.year.toString().padLeft(4, '0')}-${tanggalInput.month.toString().padLeft(2, '0')}-${tanggalInput.day.toString().padLeft(2, '0')}",
        "tanggal_final":
            "${tanggalFinal.year.toString().padLeft(4, '0')}-${tanggalFinal.month.toString().padLeft(2, '0')}-${tanggalFinal.day.toString().padLeft(2, '0')}",
        "tanggal_cetak":
            "${tanggalCetak.year.toString().padLeft(4, '0')}-${tanggalCetak.month.toString().padLeft(2, '0')}-${tanggalCetak.day.toString().padLeft(2, '0')}",
        "tanggal_upload":
            "${tanggalUpload.year.toString().padLeft(4, '0')}-${tanggalUpload.month.toString().padLeft(2, '0')}-${tanggalUpload.day.toString().padLeft(2, '0')}",
        "file": file,
        "status": statusValues.reverse[status],
        "bulan": bulan,
        "tahun": tahun,
        "dpp": dpp,
        "jp": jp,
        "bpjs_tk": bpjsTk,
        "penambah_bruto_jamsostek": penambahBrutoJamsostek,
        "total_pph": totalPph,
        "total_pajak_insentif": totalPajakInsentif,
        "hasil_pph": hasilPph,
        "bruto": bruto,
        "total_potongan": totalPotongan,
        "netto": netto,
        "entitas_karyawan": entitasKaryawan,
        "nama_divisi": namaDivisi,
        "total_penyesuaian": totalPenyesuaian,
      };
}

enum Status { FINAL }

final statusValues = EnumValues({"final": Status.FINAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
