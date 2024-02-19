import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

class HistoriSuratPeringatan extends StatefulWidget {
  const HistoriSuratPeringatan({super.key});

  @override
  State<HistoriSuratPeringatan> createState() => _HistoriSuratPeringatanState();
}

class _HistoriSuratPeringatanState extends State<HistoriSuratPeringatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Surat Peringatan",
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
