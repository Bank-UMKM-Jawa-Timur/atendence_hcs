import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class DetailLaporanRekapTetap extends StatelessWidget {
  const DetailLaporanRekapTetap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Detail Laporan Pergerakan Karir"),
    );
  }
}
