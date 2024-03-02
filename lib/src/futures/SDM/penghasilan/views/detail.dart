import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class DetailPenghasilan extends StatelessWidget {
  const DetailPenghasilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Detail Penghasilan"),
    );
  }
}
