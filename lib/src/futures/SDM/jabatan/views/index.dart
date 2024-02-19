import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

class Jabatan extends StatefulWidget {
  const Jabatan({super.key});

  @override
  State<Jabatan> createState() => _JabatanState();
}

class _JabatanState extends State<Jabatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Jabatan",
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
