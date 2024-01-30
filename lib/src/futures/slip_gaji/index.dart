import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/components/theme_status_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlipGaji extends StatefulWidget {
  const SlipGaji({super.key});

  @override
  State<SlipGaji> createState() => _SlipGajiState();
}

class _SlipGajiState extends State<SlipGaji> {
  @override
  Widget build(BuildContext context) {
    var empty = emtyPage(
      "Slip Gaji Masih Kosong!\nSilahkan Melakukan Filter\nData Terlebih Dahulu.",
    );
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: themeStatusBar,
        centerTitle: false,
        foregroundColor: Colors.black,
        title: const Text(
          "Slip Gaji",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            splashColor: Colors.white,
            onTap: () {
              _showModalButton(context, list);
            },
            child: const SizedBox(
              width: 27,
              height: 27,
              child: Image(
                image: AssetImage('assets/icon/icon_filter.png'),
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            spaceHeight(25),
            _cardPersion(),
            spaceHeight(25),
            InkWell(
              onTap: () {
                Get.toNamed(RouteNames.rincianSlipGaji);
              },
              child: _cardSlipGaji(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardSlipGaji() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gaji",
                      style: textBoldDarkMedium,
                    ),
                    Icon(
                      CommunityMaterialIcons.currency_usd_circle_outline,
                      size: 22,
                      color: cGreen_900,
                    )
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Bulan",
                      style: textGreyMedium,
                    ),
                    Text(
                      "Januari",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nominal",
                      style: textGreyMedium,
                    ),
                    Text(
                      "14.000.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
                const Text(
                  "Total Potongan",
                  style: textBoldDarkMedium,
                ),
                spaceHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nominal",
                      style: textGreyMedium,
                    ),
                    Text(
                      "1.000.000",
                      style: customTextStyle(FontWeight.w700, 12, cGrey_700),
                    ),
                  ],
                ),
                spaceHeight(5),
              ],
            ),
          ),
          Container(width: Get.width, height: 2, color: cGrey_400),
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
              color: cGrey_300,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Gaji Bersih",
                    style: textBoldGreyLarge,
                  ),
                  Text(
                    "Rp 12.900.000",
                    style: textBoldDarkLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardPersion() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cGrey_400, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Dasha Taran",
                      style: textBoldDarkLarge,
                    ),
                    spaceHeight(5),
                    const Text(
                      "Service Advisor",
                      style: textBoldGreyMedium,
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon/female.jpg'),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: Get.width,
                height: 2,
                color: cGrey_400,
              ),
            ),
            const Text(
              "Slip Gaji Tahun 2024",
              style: textBoldGreyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showModalButton(BuildContext context, List<String> list) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(10),
                Center(
                  child: Container(
                    width: 70,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: cGrey_900,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                spaceHeight(15),
                const Text(
                  "Filter",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                spaceHeight(15),
                selectKaryawan(list),
                selectYear(list),
                spaceHeight(15),
                _buttonFilter(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget selectKaryawan(List<String> list) {
    String? dropdownValue;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: DropdownButtonFormField<String>(
        hint: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Nama Karyawan'),
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
        items: <String>['2024', '2025', '2026']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget selectYear(List<String> list) {
    String? dropdownValue;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: DropdownButtonFormField<String>(
        hint: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Pilih Tahun'),
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
        items: <String>['2024', '2025', '2026']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buttonFilter() {
    return SizedBox(
      height: 40,
      width: Get.width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: cPrimary,
        ),
        child: const Text(
          "Filter",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
