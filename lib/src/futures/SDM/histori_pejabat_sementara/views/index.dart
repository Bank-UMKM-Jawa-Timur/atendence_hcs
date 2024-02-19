import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

class HistoriPejabatSementara extends StatefulWidget {
  const HistoriPejabatSementara({super.key});

  @override
  State<HistoriPejabatSementara> createState() =>
      _HistoriPejabatSementaraState();
}

class _HistoriPejabatSementaraState extends State<HistoriPejabatSementara> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Histori Pejabat Sementara",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: cPrimary,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
    );
  }
}
