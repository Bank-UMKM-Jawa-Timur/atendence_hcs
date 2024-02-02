import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget tableTotalGajiDiterima(int jml, String alias) {
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
              FormatCurrency.convertToIdr(jml, 0),
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
              alias,
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
