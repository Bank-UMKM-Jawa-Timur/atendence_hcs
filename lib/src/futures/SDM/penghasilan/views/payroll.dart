import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/components/card_payroll.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class PayrollPenghasilan extends StatelessWidget {
  const PayrollPenghasilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Payroll Penghasilan"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            cardItemsPayroll(
              context,
              0,
              "nama",
              "nip",
              "gaji",
              "norek",
              "jpBpjsTK1",
              "dpp5",
              "kreditKoperasi",
              "luaranKoperasi",
              "kreditPegawai",
              "iuranIk",
              "totalPotongan",
              "totalDiterima",
            ),
          ],
        ),
      ),
    );
  }
}
