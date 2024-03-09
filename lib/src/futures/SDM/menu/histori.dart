import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class HistoriMenu extends StatefulWidget {
  const HistoriMenu({super.key});

  @override
  State<HistoriMenu> createState() => _HistoriMenuState();
}

class _HistoriMenuState extends State<HistoriMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarPrimaryCustom("Histori", Colors.white, false, cPrimary),
    );
  }
}
