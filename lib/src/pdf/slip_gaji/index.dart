import 'dart:io';
import 'package:atendence_hcs/src/futures/slip_gaji/controllers/slip_gaji_controller.dart';
import '../../../src/pdf/slip_gaji/components/build_header.dart';
import '../../../src/pdf/slip_gaji/components/card_rincian_user.dart';
import '../../../src/pdf/slip_gaji/components/table_pendapatan.dart';
import '../../../src/pdf/slip_gaji/components/table_potongan.dart';
import '../../../src/pdf/slip_gaji/components/table_total_gaji_diterima.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SlipGajiPdf extends GetxController {
  SlipGajiController slipGajiC = Get.find<SlipGajiController>();

  void downloadSlip(
    nip,
    nama,
    norek,
    jabatan,
    tglGabung,
    lamaKerja,
  ) async {
    final img = await rootBundle.load('assets/images/logo.png');
    final imageBytes = img.buffer.asUint8List();
    pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
    final pdf = pw.Document();
    var date = DateTime.now();

    // Tambahkan halaman dengan build yang lebih kompleks
    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader(image1),
              pw.Divider(color: PdfColors.grey700),
              pw.SizedBox(height: 10),
              cardRincinaUser(nip, nama, norek, jabatan, tglGabung, lamaKerja),
              pw.SizedBox(height: 10),
              pw.Divider(color: PdfColors.grey700),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    flex: 1,
                    child: tablePendapatan(
                      slipGajiC.rincianSlipGaji!.data.tjKeluarga,
                      slipGajiC.rincianSlipGaji!.data.tjJabatan,
                      slipGajiC.rincianSlipGaji!.data.gjPenyesuaian,
                      slipGajiC.rincianSlipGaji!.data.tjPerumahan,
                      slipGajiC.rincianSlipGaji!.data.tjTelepon,
                      slipGajiC.rincianSlipGaji!.data.tjPelaksana,
                      slipGajiC.rincianSlipGaji!.data.tjKemahalan,
                      slipGajiC.rincianSlipGaji!.data.tjKesejahteraan,
                      slipGajiC.rincianSlipGaji!.data.tjTeller,
                      slipGajiC
                          .rincianSlipGaji!.data.tjKhusus, // Gaji Pokok Belum
                      slipGajiC.rincianSlipGaji!.data.gjPokok,
                      slipGajiC.rincianSlipGaji!.data.dataList.totalGaji,
                    ),
                  ),
                  pw.SizedBox(width: 20),
                  pw.Expanded(
                    flex: 1,
                    child: tablePotongan(
                      slipGajiC.rincianSlipGaji!.data.bpjsTk,
                      slipGajiC.rincianSlipGaji!.data.potongan.dpp,
                      slipGajiC.rincianSlipGaji!.data.potongan.kreditKoperasi,
                      slipGajiC.rincianSlipGaji!.data.potongan.iuranKoperasi,
                      slipGajiC.rincianSlipGaji!.data.potongan.kreditKoperasi,
                      slipGajiC.rincianSlipGaji!.data.iuranIk,
                      slipGajiC.rincianSlipGaji!.data.potongan.totalPotongan,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                width: double.infinity,
                decoration: const pw.BoxDecoration(
                  color: PdfColors.blue600,
                  border: pw.Border(
                    right: pw.BorderSide(width: 1.5, color: PdfColors.grey700),
                    top: pw.BorderSide(width: 1.5, color: PdfColors.grey700),
                    left: pw.BorderSide(width: 1.5, color: PdfColors.grey700),
                  ),
                ),
                child: pw.Padding(
                  padding: const pw.EdgeInsets.all(5),
                  child: pw.Center(
                    child: pw.Text(
                      'TOTAL GAJI YANG DI TERIMA (TAKE HOME PAY)',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 11,
                        color: PdfColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              tableTotalGajiDiterima(
                slipGajiC.rincianSlipGaji!.data.dataList.totalDiterima,
                slipGajiC.rincianSlipGaji!.data.terbilang,
              ),
              pw.SizedBox(height: 10),
              pw.Text("*) Dicetak dengan HCS"),
              // buildFooter(
              //   date,
              //   slipGajiC.rincianSlipGaji!.data.ttdKaryawan.jabatan,
              //   slipGajiC.rincianSlipGaji!.data.ttdKaryawan.namaKaryawan,
              // ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final filePath1 = '${output.path}/${slipGajiC.rincianSlipGaji!.data.file}';
    final file = File(filePath1);
    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);
  }
}
