import 'package:atendence_hcs/utils/constant.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget buildFooter(DateTime date, String jabatan, String namaTtd) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Text(""),
      pw.Container(
        padding: const pw.EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              'Kediri, ${date.fullDateAll()}',
              style: const pw.TextStyle(
                fontSize: 12,
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              jabatan.trim(),
              style: const pw.TextStyle(
                fontSize: 12,
              ),
            ),
            pw.SizedBox(height: 70),
            pw.Text(
              '($namaTtd)',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
