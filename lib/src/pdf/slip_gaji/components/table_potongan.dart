import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget tablePotongan(
  jpBpjs,
  dpp,
  kreditKoperasi,
  iuranKoperasi,
  kreditPegawai,
  iuaranIk,
  totalPotongan,
) {
  return pw.SizedBox(
    width: Get.width,
    child: pw.Table.fromTextArray(
      headers: ['Potongan', 'Jumlah'],
      data: [
        jpBpjs > 0
            ? ['JP BPJS TK 1%', FormatCurrency.convertToIdr(jpBpjs, 0)]
            : [],
        dpp > 0 ? ['DPP 5%', FormatCurrency.convertToIdr(dpp, 0)] : [],
        kreditKoperasi > 0
            ? [
                'KREDIT KOPERASI',
                FormatCurrency.convertToIdr(kreditKoperasi, 0)
              ]
            : [],
        iuranKoperasi > 0
            ? ['IURAN KOPERASI', FormatCurrency.convertToIdr(iuranKoperasi, 0)]
            : [],
        kreditKoperasi > 0
            ? ['KREDIT PEGAWAI', FormatCurrency.convertToIdr(kreditKoperasi, 0)]
            : [],
        iuaranIk > 0
            ? ['IURAN IK', FormatCurrency.convertToIdr(iuaranIk, 0)]
            : [],
        totalPotongan > 0
            ? ['TOTAL POTONGAN', FormatCurrency.convertToIdr(totalPotongan, 0)]
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
