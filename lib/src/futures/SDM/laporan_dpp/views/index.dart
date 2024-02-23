import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanDpp extends StatefulWidget {
  const LaporanDpp({super.key});

  @override
  State<LaporanDpp> createState() => _LaporanDppState();
}

class _LaporanDppState extends State<LaporanDpp> {
  String dropdownValue = "Rekap Keseluruhan";
  String dropdownValueYears = "2024";
  String dropdownValueMonth = "Januari";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Laporan DPP"),
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
                child: Column(children: [
                  formSelectKategori(),
                  dropdownValue == "Rekap Kantor Cabang"
                      ? formSelectKantor()
                      : Container(),
                  dropdownValue == "Cabang" ? formSelectCabang() : Container()
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget formSelectKategori() {
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
            // historiSpC.kategori.value = newValue;
          });
        },
        items: <String>['Rekap Keseluruhan', 'Rekap Kantor Cabang']
            .map<DropdownMenuItem<String>>((String values) {
          return DropdownMenuItem<String>(
            value: values,
            child: Text(values),
          );
        }).toList(),
      ),
    );
  }

  Widget formSelectKantor() {
    dropdownValue = "Pusat";
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

            // historiSpC.kategori.value = newValue;
          });
        },
        items: <String>['Pusat', 'Cabang']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget formSelectYears() {
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
            dropdownValueYears = newValue!;
            // historiSpC.kategori.value = newValue;
          });
        },
        items: <String>['2024', '2023', '2022']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget formSelectCabang() {
    dropdownValue = "Surabaya";
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
            // historiSpC.kategori.value = newValue;
          });
        },
        items: <String>['Surabaya', 'Bondowoso', 'Ponorogo']
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
