import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class LaporanPenonaktifan extends StatelessWidget {
  const LaporanPenonaktifan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("LaporanPenonaktifan"),
    );
  }
}
