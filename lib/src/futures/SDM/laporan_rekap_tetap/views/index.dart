import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class LaporanRekapTetap extends StatelessWidget {
  const LaporanRekapTetap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Laporan Rekap Tetap"),
    );
  }
}
