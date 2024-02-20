import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoriSuratPeringatan extends StatefulWidget {
  const HistoriSuratPeringatan({super.key});

  @override
  State<HistoriSuratPeringatan> createState() => _HistoriSuratPeringatanState();
}

class _HistoriSuratPeringatanState extends State<HistoriSuratPeringatan> {
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  String dropdownValue = "Semua Data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Histori Surat Peringatan"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(7),
                ),
                border: Border.all(color: cGrey_400, width: 1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    selectKategori(),
                  ],
                ),
              ),
            ),
            spaceHeight(10),
            Container(
              width: Get.width,
              height: Get.height / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cGrey_400, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: emptyDataSetTitle(
                  "Silahkan Cari Karyawan untuk\nmenampilkan data."),
            )
          ],
        ),
      ),
    );
  }

  Widget selectKategori() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: DropdownButtonFormField<String>(
        hint: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(dropdownValue),
        ),
        isDense: true,
        isExpanded: true,
        value: dropdownValue,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Semua Data', 'Karyawan', 'Tanggal', 'Tahun']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
