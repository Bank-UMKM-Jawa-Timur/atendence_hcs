import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class RincianPenghasilan extends StatelessWidget {
  const RincianPenghasilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Rincian Penghasilan"),
    );
  }
}
