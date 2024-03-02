import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class ProsesPenghasilan extends StatelessWidget {
  const ProsesPenghasilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Proses Penghasilan"),
    );
  }
}
