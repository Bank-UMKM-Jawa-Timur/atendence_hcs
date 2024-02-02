import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget buildHeader(pw.Image image1) {
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
