import 'package:atendence_hcs/http/sharedpreferences/prefs.dart';
import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/slip_gaji/controllers/slip_gaji_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/list_bulan.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_format_bulan.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/my_radius.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:atendence_hcs/utils/components/slip_gaji/card_persion.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlipGaji extends StatefulWidget {
  String user;
  SlipGaji({super.key, required this.user});

  @override
  State<SlipGaji> createState() => _SlipGajiState();
}

class _SlipGajiState extends State<SlipGaji> {
  ListBulan listBulanC = Get.put(ListBulan());
  SlipGajiController slipGajiC = Get.put(SlipGajiController());
  var prefsC = Get.find<PrefsController>();
  String? valueBulan;
  String dropdownValueYear = "Pilih Tahun";
  DateTime? valueYear;
  String nip = "";
  String nama = "Cari Karyawan";

  @override
  void initState() {
    super.initState();
    slipGajiC.user.value = widget.user;
    if (widget.user != "sdm") {
      slipGajiC.filter();
    } else {
      nip = Get.arguments[0]['nip'] ?? "";
      nama = Get.arguments[1]['nama'];
      if (nip != "") {
        slipGajiC.nip.value = nip;
        slipGajiC.filter();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        foregroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 2),
          child: Text(
            "Slip Gaji",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          InkWell(
            splashColor: cPrimary,
            onTap: () {
              _showModalButton(context);
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
        backgroundColor: cPrimary,
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        spaceHeight(25),
                        cardPersion(
                          shortenLastName(
                              slipGajiC.listSlipGaji!.rincian.namaKaryawan),
                          slipGajiC.listSlipGaji!.rincian.namaJabatan.trim(),
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

  Future<dynamic> _showModalButton(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: 350,
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
                  widget.user == "sdm"
                      ? InkWell(
                          onTap: () {
                            Get.toNamed(
                              RouteNames.searchKaryawan,
                              arguments: RouteNames.slipGaji,
                            );
                          },
                          child: Container(
                            width: Get.width,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: cGrey_700),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.search,
                                      color: cGrey_900,
                                      size: 22,
                                    ),
                                  ),
                                  spaceWidth(8),
                                  Expanded(
                                    flex: 10,
                                    child: Text(
                                      nip == "" ? nama : "$nip - $nama",
                                      // "Cari Karyawan",
                                      style: const TextStyle(
                                        color: cGrey_900,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: SizedBox(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  spaceHeight(8),
                  _selectBulan(),
                  // selectYear(),
                  spaceHeight(8),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                "Pilih Tahun",
                                style: customTextStyle(
                                    FontWeight.w500, 17, cPrimary),
                              ),
                              surfaceTintColor: Colors.white,
                              content: SizedBox(
                                width: 300,
                                height: 300,
                                child: YearPicker(
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime.now(),
                                  selectedDate: valueYear,
                                  initialDate: DateTime.now(),
                                  onChanged: (value) {
                                    setState(() {
                                      valueYear = value;
                                    });
                                    Get.back();
                                  },
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: cGrey_700),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        child: Text(
                          valueYear?.year.toString() ??
                              DateTime.now().year.toString(),
                          style:
                              const TextStyle(fontSize: 16, color: cGrey_900),
                        ),
                      ),
                    ),
                  ),
                  spaceHeight(15),
                  _buttonFilter(),
                ],
              ),
            ),
          );
        });
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
            ? dropdownValueYear
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
            dropdownValueYear = newValue!;
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
          if (widget.user == "sdm" && nip == "") {
            snackbarfailed("Cari karyawan, sebelum filter data");
          } else {
            slipGajiC.filter();
          }
          // slipGajiC.filter();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: cPrimary,
          shape: radiusElevetedBtn,
        ),
        child: const Text(
          "Filter",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
