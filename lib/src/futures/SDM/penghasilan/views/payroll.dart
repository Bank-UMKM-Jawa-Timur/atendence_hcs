import 'package:atendence_hcs/src/futures/SDM/penghasilan/controllers/payroll_penghasilan_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/components/card_payroll.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_short_two_caracter_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayrollPenghasilan extends StatelessWidget {
  const PayrollPenghasilan({super.key});

  @override
  Widget build(BuildContext context) {
    var nip = Get.arguments['nip'];
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Payroll Penghasilan"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GetX<PayrollPenghasilanController>(
          init: PayrollPenghasilanController(),
          initState: (c) {
            var id = Get.arguments['id'];
            var bulan = Get.arguments['bulan'];
            var tahun = Get.arguments['tahun'];
            var nip = Get.arguments['nip'];
            c.controller!.getRincianPenghasilan(id, bulan, tahun, nip);
          },
          builder: (c) {
            return c.isLoading.value
                ? Center(
                    child: loadingPage(),
                  )
                : Column(
                    children: [
                      cardItemsPayroll(
                        context,
                        shortTwoCaracterName(
                            c.payrollPenghasilanM!.data.namaKaryawan),
                        c.payrollPenghasilanM!.data.namaKaryawan,
                        nip,
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.gaji, 0),
                        c.payrollPenghasilanM!.data.noRekening ?? '-',
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.bpjsTk, 0),
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.dpp, 0),
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.kreditKoperasi, 0),
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.iuranKoperasi, 0),
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.kreditPegawai, 0),
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.iuranIk, 0),
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.totalPotongan, 0),
                        FormatCurrency.convertToIdr(
                            c.payrollPenghasilanM!.data.totalYgDiterima, 0),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
