import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/components/card_detail.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:flutter/material.dart';

class DetailPenghasilan extends StatelessWidget {
  const DetailPenghasilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrimary("Detail Penghasilan"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              cardDetail(
                10000000,
                10000000,
                10000000,
                10000000,
                10000000,
                10000000,
                1000000000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
