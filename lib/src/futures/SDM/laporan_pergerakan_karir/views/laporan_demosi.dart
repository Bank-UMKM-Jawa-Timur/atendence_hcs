import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class LaporanDemosi extends StatelessWidget {
  const LaporanDemosi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("LaporanDemosi"),
    );
  }
}
