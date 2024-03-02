import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class PayrollPenghasilan extends StatelessWidget {
  const PayrollPenghasilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Payroll Penghasilan"),
    );
  }
}
