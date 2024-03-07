import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class DetailPayments extends StatelessWidget {
  const DetailPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Detail Perkiraan Gaji"),
    );
  }
}
