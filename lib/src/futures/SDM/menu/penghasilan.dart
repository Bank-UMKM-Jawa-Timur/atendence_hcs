import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class PenghasilanMenu extends StatefulWidget {
  const PenghasilanMenu({super.key});

  @override
  State<PenghasilanMenu> createState() => _PenghasilanMenuState();
}

class _PenghasilanMenuState extends State<PenghasilanMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarPrimaryCustom("Penghasilan", Colors.white, false, cPrimary),
    );
  }
}
