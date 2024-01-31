import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SlipGajiPdf {
  void downloadSlip() async {
    final img = await rootBundle.load('assets/images/logo.png');
    final imageBytes = img.buffer.asUint8List();
    pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
    final pdf = pw.Document();

    // Tambahkan halaman dengan build yang lebih kompleks
    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildHeader(image1),
              pw.Divider(color: PdfColors.grey700),
              pw.SizedBox(height: 10),
              pw.Divider(color: PdfColors.grey700),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    flex: 1,
                    child: _tablePendapatan(),
                  ),
                  pw.SizedBox(width: 20),
                  pw.Expanded(
                    flex: 1,
                    child: _tablePotongan(),
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
              _tableTotalGajiDiterima(),
              // pw.SizedBox(
              //   width: Get.width,
              //   child: _tableTotalGajiDiterima(),
              // ),
              _buildFooter(),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final filePath1 = '${output.path}/Kategori berdasarkan.pdf';
    final file = File(filePath1);
    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);
  }

  pw.Widget _buildHeader(pw.Image image1) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.SizedBox(width: 60, height: 60, child: image1),
          pw.SizedBox(width: 10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                "Slip Gaji Pegawai".toUpperCase(),
                style: const pw.TextStyle(color: PdfColors.black),
              ),
              pw.SizedBox(height: 3),
              pw.Text(
                "Periode 2024 Januari",
                style: const pw.TextStyle(color: PdfColors.black),
              ),
              pw.SizedBox(height: 3),
              pw.Text(
                "Bank BPR Jatim",
                style: const pw.TextStyle(color: PdfColors.black),
              ),
            ],
          )
        ],
      ),
    );
  }

  pw.Widget _buildFooter() {
    return pw.Container(
      margin: pw.EdgeInsets.only(top: 10),
      child: pw.Text(
        'Terima kasih atas kerjasama Anda!',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      ),
    );
  }

  pw.Widget _tablePendapatan() {
    return pw.SizedBox(
      width: Get.width,
      child: pw.Table.fromTextArray(
        headers: ['Pendapatan', 'Jumlah'],
        data: [
          ['Gaji Pokok', 'Rp 5.000'],
          ['Tj. Keluarga', 'Rp 4,500'],
          ['Tj. Kemahalan', 'Rp 6,000'],
          ['Tj. Kesejahteraan', 'Rp 6,000'],
        ],
        cellAlignment: pw.Alignment.centerLeft,
        cellAlignments: {1: pw.Alignment.centerRight},
        cellStyle: const pw.TextStyle(fontSize: 12),
        headerAlignments: {1: pw.Alignment.center},
        headerStyle: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: 12,
          color: PdfColors.white,
        ),
        border: pw.TableBorder.all(width: 1, color: PdfColors.grey700),
        headerDecoration: const pw.BoxDecoration(color: PdfColors.blue600),
      ),
    );
  }

  pw.Widget _tablePotongan() {
    return pw.SizedBox(
      width: Get.width,
      child: pw.Table.fromTextArray(
        headers: ['Pendapatan', 'Jumlah'],
        data: [
          ['JP BPJS TK 1%', 'Rp 5.000'],
          ['DPP 5%', 'Rp 4,500'],
          ['IURAN IK', 'Rp 6,000'],
        ],
        cellAlignment: pw.Alignment.centerLeft,
        cellAlignments: {1: pw.Alignment.centerRight},
        cellStyle: const pw.TextStyle(fontSize: 12),
        headerAlignments: {1: pw.Alignment.center},
        headerStyle: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: 12,
          color: PdfColors.white,
        ),
        border: pw.TableBorder.all(width: 1, color: PdfColors.grey700),
        headerDecoration: const pw.BoxDecoration(color: PdfColors.blue600),
      ),
    );
  }

  pw.Widget _tableTotalGajiDiterima() {
    return pw.Table(
      columnWidths: {
        0: const pw.FlexColumnWidth(1),
        1: const pw.FlexColumnWidth(4),
      },
      children: [
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Text('JUMLAH', style: const pw.TextStyle(fontSize: 11)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Text(
                'Rp 5.000',
                style: const pw.TextStyle(fontSize: 11),
                textAlign: pw.TextAlign.right,
              ),
            ),
          ],
          decoration: const pw.BoxDecoration(color: PdfColors.white),
        ),
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child:
                  pw.Text('TERBILANG', style: const pw.TextStyle(fontSize: 11)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Text(
                'LIMA JUTA LIMA RATUS LIMA PULUH SEMBILAN',
                style: const pw.TextStyle(fontSize: 11),
                textAlign: pw.TextAlign.right,
              ),
            ),
          ],
          decoration: const pw.BoxDecoration(color: PdfColors.white),
        ),
      ],
      border: pw.TableBorder.all(width: 1, color: PdfColors.grey700),
    );
  }
}
