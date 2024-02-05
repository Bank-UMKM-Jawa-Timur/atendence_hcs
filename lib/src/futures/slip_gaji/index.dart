import 'package:atendence_hcs/http/controllers/slip_gaji/slip_gaji_controller.dart';
import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/list_bulan.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_format_bulan.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/slip_gaji/card_persion.dart';
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
  ListBulan listBulanC = Get.put(ListBulan());
  SlipGajiController slipGajiC = Get.put(SlipGajiController());
  var prefsC = Get.find<PrefsController>();
  String? valueBulan;
  String? dropdownValue;

  @override
  void initState() {
    slipGajiC.filter(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var empty = emtyPage(
      "Slip Gaji Masih Kosong!",
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
      body: Obx(
        () => slipGajiC.isLoading.value
            ? const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    backgroundColor: cPrimary_300,
                    color: cPrimary,
                    strokeWidth: 5,
                  ),
                ),
              )
            : slipGajiC.dataIsEmpty.value
                ? searchEmptyPage(
                    "Data slip gaji, Periode ${slipGajiC.selectedBulan.value != '' ? 'Bulan ' + FormatBulan().formatBulan(int.parse(slipGajiC.selectedBulan.value)) : ''} ${slipGajiC.selectedTahun.value}\nMasih Kosong.")
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        spaceHeight(25),
                        cardPersion(
                          prefsC.namaKaryawan.value,
                          prefsC.displayJabatan.value.trim(),
                          slipGajiC.selectedTahun.value,
                          "Laki-laki",
                        ),
                        spaceHeight(10),
                        _cardSlipGaji(),
                      ],
                    ),
                  ),
        // body: Obx(
        //   () => slipGajiC.typeFilter.value
        //       ? slipGajiC.isLoading.value
        //           ? const Center(
        //               child: SizedBox(
        //                 width: 40,
        //                 height: 40,
        //                 child: CircularProgressIndicator(
        //                   backgroundColor: cPrimary_300,
        //                   color: cPrimary,
        //                   strokeWidth: 5,
        //                 ),
        //               ),
        //             )
        //           : slipGajiC.dataIsEmpty.value
        //               ? searchEmptyPage(
        //                   "Filter Data, Kosong.\nPada Bulan ${FormatBulan().formatBulan(int.parse(slipGajiC.selectedBulan.value))} ${slipGajiC.selectedTahun.value} ")
        //               : Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 25),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     children: [
        //                       spaceHeight(25),
        //                       cardPersion(
        //                         prefsC.namaKaryawan.value,
        //                         prefsC.displayJabatan.value.trim(),
        //                         slipGajiC.selectedTahun.value,
        //                         "Laki-laki",
        //                       ),
        //                       spaceHeight(10),
        //                       _cardSlipGaji(),
        //                     ],
        //                   ),
        //                 )
        //       : empty,
      ),
    );
  }

  Widget _cardSlipGaji() {
    return ListView.builder(
      itemCount: slipGajiC.listSlipGaji!.data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            slipGajiC.getRincian(slipGajiC.listSlipGaji!.data[index].id);
            await Get.toNamed(RouteNames.rincianSlipGaji);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: cGrey_400, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                      spaceHeight(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Bulan",
                            style: textGreyMedium,
                          ),
                          Text(
                            FormatBulan().formatBulan(
                              slipGajiC
                                  .listSlipGaji!.data[index].dataList.bulan,
                            ),
                            style:
                                customTextStyle(FontWeight.w700, 12, cGrey_700),
                          ),
                        ],
                      ),
                      spaceHeight(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Nominal",
                            style: textGreyMedium,
                          ),
                          Text(
                            FormatCurrency.convertToIdr(
                                slipGajiC.listSlipGaji!.data[index].dataList
                                    .totalGaji,
                                0),
                            style:
                                customTextStyle(FontWeight.w700, 12, cGrey_700),
                          ),
                        ],
                      ),
                      spaceHeight(10),
                      const Text(
                        "Total Potongan",
                        style: textBoldDarkMedium,
                      ),
                      spaceHeight(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Nominal",
                            style: textGreyMedium,
                          ),
                          Text(
                            FormatCurrency.convertToIdr(
                                slipGajiC.listSlipGaji!.data[index].dataList
                                    .totalPotongan,
                                0),
                            style:
                                customTextStyle(FontWeight.w700, 12, cGrey_700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(width: Get.width, height: 1, color: cGrey_400),
                Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: cGrey_100,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Gaji Bersih",
                          style:
                              customTextStyle(FontWeight.w700, 14, cGrey_700),
                        ),
                        Text(
                          FormatCurrency.convertToIdr(
                              slipGajiC.listSlipGaji!.data[index].dataList
                                  .totalDiterima,
                              0),
                          style: textBoldDarkLarge,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
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
                // selectKaryawan(list),
                _selectBulan(),
                selectYear(),
                spaceHeight(15),
                _buttonFilter(),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _selectBulan() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: DropdownButtonFormField<String>(
        hint: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Pilih Bulan'),
        ),
        isDense: true,
        isExpanded: true,
        value: slipGajiC.selectedBulan.value == ""
            ? valueBulan
            : slipGajiC.selectedBulan.value,
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
            valueBulan = newValue!;
            slipGajiC.selectedBulan.value = newValue;
          });
        },
        items: listBulanC.bulan.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value['type'],
            child: Text(value['nama']),
          );
        }).toList(),
      ),
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

  Widget selectYear() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: DropdownButtonFormField<String>(
        hint: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Pilih Tahun'),
        ),
        isDense: true,
        isExpanded: true,
        value: slipGajiC.selectedTahun.value == ""
            ? dropdownValue
            : slipGajiC.selectedTahun.value,
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
            slipGajiC.selectedTahun.value = newValue;
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
        onPressed: () {
          slipGajiC.filter(true);
        },
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
