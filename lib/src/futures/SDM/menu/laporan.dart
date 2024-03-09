import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class LaporanMenu extends StatefulWidget {
  const LaporanMenu({super.key});

  @override
  State<LaporanMenu> createState() => _LaporanMenuState();
}

class _LaporanMenuState extends State<LaporanMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarPrimaryCustom("Laporan", Colors.white, false, cPrimary),
    );
  }
}
