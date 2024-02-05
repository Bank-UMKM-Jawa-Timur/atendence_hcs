import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget tablePendapatan(
  tjKeluarga,
  tjJabatan,
  gjPenyesuaian,
  tjPerumahan,
  tjTelepon,
  tjPelaksana,
  tjKemahalan,
  tjKesejahteraan,
  tjTeller,
  tjKusus,
  gjPokok,
  totalPendapatan,
) {
  return pw.SizedBox(
    width: Get.width,
    child: pw.Table.fromTextArray(
      headers: ['Pendapatan', 'Jumlah'],
      data: [
        ['Gaji Pokok', FormatCurrency.convertToIdr(gjPokok, 0)],
        tjKeluarga > 0
            ? ['Tj. Keluarga', FormatCurrency.convertToIdr(tjKeluarga, 0)]
            : [],
        tjJabatan > 0
            ? ['Tj. Jabatan', FormatCurrency.convertToIdr(tjJabatan, 0)]
            : [],
        gjPenyesuaian > 0
            ? [
                'Gagi Penyesuaian',
                FormatCurrency.convertToIdr(gjPenyesuaian, 0)
              ]
            : [],
        tjPerumahan > 0
            ? ['Tj. Perumahan', FormatCurrency.convertToIdr(tjPerumahan, 0)]
            : [],
        tjTelepon > 0
            ? [
                'Tj. Telepon, Listrik & Air',
                FormatCurrency.convertToIdr(tjTelepon, 0)
              ]
            : [],
        tjPelaksana > 0
            ? ['Tj. Pelaksana', FormatCurrency.convertToIdr(tjPelaksana, 0)]
            : [],
        tjKemahalan > 0
            ? ['Tj. Kemahalan', FormatCurrency.convertToIdr(tjKemahalan, 0)]
            : [],
        tjKesejahteraan > 0
            ? [
                'Tj. Kesejahteraan',
                FormatCurrency.convertToIdr(tjKesejahteraan, 0)
              ]
            : [],
        tjTeller > 0
            ? ['Tj. Teller', FormatCurrency.convertToIdr(tjTeller, 0)]
            : [],
        tjKusus > 0
            ? ['Tj. Khusus', FormatCurrency.convertToIdr(tjKusus, 0)]
            : [],
        totalPendapatan > 0
            ? [
                'TOTAL PENDAPATAN',
                FormatCurrency.convertToIdr(totalPendapatan, 0)
              ]
            : [],
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
