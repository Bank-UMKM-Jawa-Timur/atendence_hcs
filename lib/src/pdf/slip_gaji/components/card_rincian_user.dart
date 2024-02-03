import 'package:pdf/widgets.dart' as pw;

pw.Widget cardRincinaUser(nip, nama, norek, jabatan, tglGabung, lamaKerja) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 80,
                child: pw.Text('Nip'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(right: 10),
                child: pw.Text(':'),
              ),
              pw.Text(nip)
            ],
          ),
          pw.SizedBox(height: 5),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 80,
                child: pw.Text('Nama'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(right: 10),
                child: pw.Text(':'),
              ),
              pw.Container(
                width: 135,
                // color: PdfColors.amber,
                child: pw.Text(nama),
              )
            ],
          ),
          pw.SizedBox(height: 5),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 80,
                child: pw.Text('No Rekening'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(right: 10),
                child: pw.Text(':'),
              ),
              pw.Text(norek)
            ],
          ),
        ],
      ),
      pw.SizedBox(width: 40),
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 115,
                child: pw.Text('Jabatan'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(right: 10),
                child: pw.Text(':'),
              ),
              pw.Container(
                width: 130,
                // color: PdfColors.amber,
                child: pw.Text(jabatan.trim(), textAlign: pw.TextAlign.start),
              )
            ],
          ),
          pw.SizedBox(height: 5),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 115,
                child: pw.Text('Tanggal Bergabung'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(right: 10),
                child: pw.Text(':'),
              ),
              pw.Text(tglGabung)
            ],
          ),
          pw.SizedBox(height: 5),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 115,
                child: pw.Text('Lama Kerja'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(right: 10),
                child: pw.Text(':'),
              ),
              pw.Text(lamaKerja)
            ],
          ),
        ],
      ),
    ],
  );
}
