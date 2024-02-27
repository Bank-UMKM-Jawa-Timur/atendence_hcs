import 'dart:convert';

ListSlipGajiModel listSlipGajiModelFromJson(String str) =>
    ListSlipGajiModel.fromJson(json.decode(str));

String listSlipGajiModelToJson(ListSlipGajiModel data) =>
    json.encode(data.toJson());

class ListSlipGajiModel {
  int status;
  String message;
  Rincian rincian;
  List<Datum> data;

  ListSlipGajiModel({
    required this.status,
    required this.message,
    required this.rincian,
    required this.data,
  });

  factory ListSlipGajiModel.fromJson(Map<String, dynamic> json) =>
      ListSlipGajiModel(
        status: json["status"],
        message: json["message"],
        rincian: Rincian.fromJson(json["rincian"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "rincian": rincian.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int batchId;
  DateTime tanggalInput;
  DateTime tanggalCetak;
  DateTime tanggalUpload;
  DateTime tanggalFinal;
  String? file;
  String? status;
  String? nip;
  int bulan;
  int gjPokok;
  int gjPenyesuaian;
  int tjKeluarga;
  int tjTelepon;
  int tjJabatan;
  int tjTeller;
  int tjPerumahan;
  int tjKemahalan;
  int tjPelaksana;
  int tjKesejahteraan;
  int tjMultilevel;
  int tjTi;
  int tjFungsional;
  int tjTransport;
  int tjPulsa;
  int tjVitamin;
  int uangMakan;
  int dpp;
  int kreditKoperasi;
  int iuranKoperasi;
  int kreditPegawai;
  int iuranIk;
  int gaji;
  int totalGaji;
  int totalTunjanganLainnya;
  int jamsostek;
  int bpjsTk;
  int bpjsKesehatan;
  Potongan potongan;
  int totalDiterima;
  DataList dataList;

  Datum({
    required this.id,
    required this.batchId,
    required this.tanggalInput,
    required this.tanggalCetak,
    required this.tanggalUpload,
    required this.tanggalFinal,
    required this.file,
    required this.status,
    required this.nip,
    required this.bulan,
    required this.gjPokok,
    required this.gjPenyesuaian,
    required this.tjKeluarga,
    required this.tjTelepon,
    required this.tjJabatan,
    required this.tjTeller,
    required this.tjPerumahan,
    required this.tjKemahalan,
    required this.tjPelaksana,
    required this.tjKesejahteraan,
    required this.tjMultilevel,
    required this.tjTi,
    required this.tjFungsional,
    required this.tjTransport,
    required this.tjPulsa,
    required this.tjVitamin,
    required this.uangMakan,
    required this.dpp,
    required this.kreditKoperasi,
    required this.iuranKoperasi,
    required this.kreditPegawai,
    required this.iuranIk,
    required this.gaji,
    required this.totalGaji,
    required this.totalTunjanganLainnya,
    required this.jamsostek,
    required this.bpjsTk,
    required this.bpjsKesehatan,
    required this.potongan,
    required this.totalDiterima,
    required this.dataList,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        batchId: json["batch_id"],
        tanggalInput: DateTime.parse(json["tanggal_input"]),
        tanggalCetak: DateTime.parse(json["tanggal_cetak"]),
        tanggalUpload: DateTime.parse(json["tanggal_upload"]),
        tanggalFinal: DateTime.parse(json["tanggal_final"]),
        file: json["file"],
        status: json["status"],
        nip: json["nip"],
        bulan: json["bulan"],
        gjPokok: json["gj_pokok"],
        gjPenyesuaian: json["gj_penyesuaian"],
        tjKeluarga: json["tj_keluarga"],
        tjTelepon: json["tj_telepon"],
        tjJabatan: json["tj_jabatan"],
        tjTeller: json["tj_teller"],
        tjPerumahan: json["tj_perumahan"],
        tjKemahalan: json["tj_kemahalan"],
        tjPelaksana: json["tj_pelaksana"],
        tjKesejahteraan: json["tj_kesejahteraan"],
        tjMultilevel: json["tj_multilevel"],
        tjTi: json["tj_ti"],
        tjFungsional: json["tj_fungsional"],
        tjTransport: json["tj_transport"],
        tjPulsa: json["tj_pulsa"],
        tjVitamin: json["tj_vitamin"],
        uangMakan: json["uang_makan"],
        dpp: json["dpp"],
        kreditKoperasi: json["kredit_koperasi"],
        iuranKoperasi: json["iuran_koperasi"],
        kreditPegawai: json["kredit_pegawai"],
        iuranIk: json["iuran_ik"],
        gaji: json["gaji"],
        totalGaji: json["total_gaji"],
        totalTunjanganLainnya: json["total_tunjangan_lainnya"],
        jamsostek: json["jamsostek"],
        bpjsTk: json["bpjs_tk"],
        bpjsKesehatan: json["bpjs_kesehatan"],
        potongan: Potongan.fromJson(json["potongan"]),
        totalDiterima: json["total_diterima"],
        dataList: DataList.fromJson(json["data_list"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_id": batchId,
        "tanggal_input":
            "${tanggalInput.year.toString().padLeft(4, '0')}-${tanggalInput.month.toString().padLeft(2, '0')}-${tanggalInput.day.toString().padLeft(2, '0')}",
        "tanggal_cetak":
            "${tanggalCetak.year.toString().padLeft(4, '0')}-${tanggalCetak.month.toString().padLeft(2, '0')}-${tanggalCetak.day.toString().padLeft(2, '0')}",
        "tanggal_upload":
            "${tanggalUpload.year.toString().padLeft(4, '0')}-${tanggalUpload.month.toString().padLeft(2, '0')}-${tanggalUpload.day.toString().padLeft(2, '0')}",
        "tanggal_final":
            "${tanggalFinal.year.toString().padLeft(4, '0')}-${tanggalFinal.month.toString().padLeft(2, '0')}-${tanggalFinal.day.toString().padLeft(2, '0')}",
        "file": file,
        "status": status,
        "nip": nip,
        "bulan": bulan,
        "gj_pokok": gjPokok,
        "gj_penyesuaian": gjPenyesuaian,
        "tj_keluarga": tjKeluarga,
        "tj_telepon": tjTelepon,
        "tj_jabatan": tjJabatan,
        "tj_teller": tjTeller,
        "tj_perumahan": tjPerumahan,
        "tj_kemahalan": tjKemahalan,
        "tj_pelaksana": tjPelaksana,
        "tj_kesejahteraan": tjKesejahteraan,
        "tj_multilevel": tjMultilevel,
        "tj_ti": tjTi,
        "tj_fungsional": tjFungsional,
        "tj_transport": tjTransport,
        "tj_pulsa": tjPulsa,
        "tj_vitamin": tjVitamin,
        "uang_makan": uangMakan,
        "dpp": dpp,
        "kredit_koperasi": kreditKoperasi,
        "iuran_koperasi": iuranKoperasi,
        "kredit_pegawai": kreditPegawai,
        "iuran_ik": iuranIk,
        "gaji": gaji,
        "total_gaji": totalGaji,
        "total_tunjangan_lainnya": totalTunjanganLainnya,
        "jamsostek": jamsostek,
        "bpjs_tk": bpjsTk,
        "bpjs_kesehatan": bpjsKesehatan,
        "potongan": potongan.toJson(),
        "total_diterima": totalDiterima,
        "data_list": dataList.toJson(),
      };
}

class DataList {
  int totalDiterima;
  int totalPotongan;
  int totalGaji;
  int bulan;
  int tahun;

  DataList({
    required this.totalDiterima,
    required this.totalPotongan,
    required this.totalGaji,
    required this.bulan,
    required this.tahun,
  });

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
        totalDiterima: json["total_diterima"],
        totalPotongan: json["total_potongan"],
        totalGaji: json["total_gaji"],
        bulan: json["bulan"],
        tahun: json["tahun"],
      );

  Map<String, dynamic> toJson() => {
        "total_diterima": totalDiterima,
        "total_potongan": totalPotongan,
        "total_gaji": totalGaji,
        "bulan": bulan,
        "tahun": tahun,
      };
}

class Potongan {
  int dpp;
  int jp1Persen;
  int kreditKoperasi;
  int iuranKoperasi;
  int kreditPegawai;
  int iuranIk;
  int totalPotongan;

  Potongan({
    required this.dpp,
    required this.jp1Persen,
    required this.kreditKoperasi,
    required this.iuranKoperasi,
    required this.kreditPegawai,
    required this.iuranIk,
    required this.totalPotongan,
  });

  factory Potongan.fromJson(Map<String, dynamic> json) => Potongan(
        dpp: json["dpp"],
        jp1Persen: json["jp_1_persen"],
        kreditKoperasi: json["kredit_koperasi"],
        iuranKoperasi: json["iuran_koperasi"],
        kreditPegawai: json["kredit_pegawai"],
        iuranIk: json["iuran_ik"],
        totalPotongan: json["total_potongan"],
      );

  Map<String, dynamic> toJson() => {
        "dpp": dpp,
        "jp_1_persen": jp1Persen,
        "kredit_koperasi": kreditKoperasi,
        "iuran_koperasi": iuranKoperasi,
        "kredit_pegawai": kreditPegawai,
        "iuran_ik": iuranIk,
        "total_potongan": totalPotongan,
      };
}

class Rincian {
  String nip;
  String namaKaryawan;
  String? jk;
  String? statusJabatan;
  String? namaJabatan;
  String? pangkatGolongan;
  String? kantor;

  Rincian({
    required this.nip,
    required this.namaKaryawan,
    required this.jk,
    required this.statusJabatan,
    required this.namaJabatan,
    required this.pangkatGolongan,
    required this.kantor,
  });

  factory Rincian.fromJson(Map<String, dynamic> json) => Rincian(
        nip: json["nip"],
        namaKaryawan: json["nama_karyawan"],
        jk: json["jk"],
        statusJabatan: json["status_jabatan"],
        namaJabatan: json["nama_jabatan"],
        pangkatGolongan: json["pangkat_golongan"],
        kantor: json["kantor"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama_karyawan": namaKaryawan,
        "jk": jk,
        "status_jabatan": statusJabatan,
        "nama_jabatan": namaJabatan,
        "pangkat_golongan": pangkatGolongan,
        "kantor": kantor,
      };
}
