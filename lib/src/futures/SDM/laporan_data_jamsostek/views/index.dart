import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/cabang_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/laporan_data_jamsostek/controllers/laporan_jamsostek_controller.dart';
import 'package:atendence_hcs/utils/components/list_bulan.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shadow.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanDataJamsostek extends StatefulWidget {
  const LaporanDataJamsostek({super.key});

  @override
  State<LaporanDataJamsostek> createState() => _LaporanDataJamsostekState();
}

class _LaporanDataJamsostekState extends State<LaporanDataJamsostek> {
  ListBulan listBulan = Get.put(ListBulan());
  CabangController cabangC = Get.find<CabangController>();
  LaporanJamsostekController jamsostekC =
      Get.find<LaporanJamsostekController>();
  String? dropdownValueKat;
  String? dropdownValueMonth;
  DateTime? valueYear;
  String? dropdownValueKantor;
  String? kdCabang;
  bool isActive = false;
  bool isFilterKeseluruhan = true;
  int page = 1;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        _fetchPage();
      }
    });
  }

  _fetchPage() {
    setState(() {
      page++;
    });
    jamsostekC.getLaporanJamsostekKantor(
      dropdownValueKantor,
      kdCabang,
      page,
    );
    setState(() {});
  }

  fetchKantor() {
    page = 1;
    isFilterKeseluruhan = false;
    jamsostekC.jamsostekKeseluruhanM?.data.clear();
    jamsostekC.jamsostekKantorM?.data.clear();
    jamsostekC.getLaporanJamsostekKantor(
      dropdownValueKantor,
      kdCabang,
      page,
    );
    setState(() {});
  }

  fetchKeseluruhan() {
    isFilterKeseluruhan = true;
    jamsostekC.jamsostekKeseluruhanM?.data.clear();
    jamsostekC.jamsostekKantorM?.data.clear();
    jamsostekC.getLaporanJamsostekKeseluruhan();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Laporan data Jamsostek"),
      bottomNavigationBar: Obx(
        () => isFilterKeseluruhan
            ? jamsostekC.isLoading.value
                ? loadingPage()
                : jamsostekC.isEmptyData.value
                    ? const SizedBox()
                    : cardCountData()
            : page == 1
                ? jamsostekC.isLoading2.value
                    ? loadingPage()
                    : jamsostekC.isEmptyData2.value
                        ? const SizedBox()
                        : cardCountData()
                : cardCountData(),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              AnimatedSize(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    border: Border.all(color: cGrey_400, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      children: [
                        formSelectKategori(),
                        isActive
                            ? Container()
                            : Column(
                                children: [
                                  dropdownValueKat == "Rekap Kantor Cabang"
                                      ? formSelectKantor()
                                      : Container(),
                                  dropdownValueKat == "Rekap Kantor Cabang"
                                      ? dropdownValueKantor == "Cabang"
                                          ? cabangC.isLoading.value
                                              ? loadingPage()
                                              : formSelectCabang()
                                          : Container()
                                      : Container(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 5),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: Text(
                                                  "Pilih Tahun",
                                                  style: customTextStyle(
                                                      FontWeight.w500,
                                                      17,
                                                      cPrimary),
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
                                                        jamsostekC.tahun.value =
                                                            value.getYear();
                                                      });
                                                      Get.back();
                                                    },
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tahun",
                                            style: customTextStyle(
                                              FontWeight.w600,
                                              12,
                                              cGrey_700,
                                            ),
                                          ),
                                          spaceHeight(5),
                                          Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1, color: cGrey_700),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 10),
                                              child: Text(
                                                valueYear?.year.toString() ??
                                                    DateTime.now()
                                                        .year
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: cGrey_900),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  formSelectMonth(),
                                  Container(
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: cPrimary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    width: Get.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (dropdownValueKat == null) {
                                          snackbarfailed(
                                              "Kategori harap dipilih!");
                                        } else {
                                          if (dropdownValueMonth == null) {
                                            snackbarfailed(
                                                "Bulan harap dipilih!");
                                          } else {
                                            if (dropdownValueKat ==
                                                "Rekap Keseluruhan") {
                                              fetchKeseluruhan();
                                            } else {
                                              if (dropdownValueKantor != null) {
                                                if (dropdownValueKantor ==
                                                    "Cabang") {
                                                  if (kdCabang == null) {
                                                    snackbarfailed(
                                                        "Cabang harap dipilih!");
                                                  } else {
                                                    fetchKantor();
                                                  }
                                                } else {
                                                  fetchKantor();
                                                }
                                              } else {
                                                snackbarfailed(
                                                    "Kantor harap dipilih!");
                                              }
                                            }
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: cPrimary,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            CommunityMaterialIcons
                                                .filter_outline,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          spaceWidth(5),
                                          const Text(
                                            "Tampilkan",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              spaceHeight(10),
              isFilterKeseluruhan
                  ? jamsostekC.isLoading.value
                      ? loadingPage()
                      : jamsostekC.isEmptyData.value
                          ? Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  width: Get.width,
                                  height: Get.height / 2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: cGrey_400, width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: emptyDataSetTitle(
                                    "Silahkan Filter untuk menampilkan data\nLaporan Jamsostek.",
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: jamsostekC
                                        .jamsostekKeseluruhanM?.data.length ??
                                    0,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var data =
                                      jamsostekC.jamsostekKeseluruhanM!.data;
                                  return cardItemsKeseluruhan(
                                    index + 1,
                                    data[index].kantor,
                                    data[index].kdKantor,
                                    data[index].totalKaryawan.toString(),
                                    data[index].jkk,
                                    data[index].jht,
                                    data[index].jkm,
                                    int.parse(data[index]
                                            .jkk
                                            .replaceAll(".", "")) +
                                        int.parse(data[index]
                                            .jht
                                            .replaceAll('.', "")) +
                                        int.parse(data[index]
                                            .jkm
                                            .replaceAll('.', "")),
                                    data[index].jp1,
                                    data[index].jp2,
                                    data[index].totalJp,
                                  );
                                },
                              ),
                            )
                  : page == 1
                      ? jamsostekC.isLoading2.value
                          ? loadingPage()
                          : jamsostekC.isEmptyData2.value
                              ? Expanded(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      width: Get.width,
                                      height: Get.height / 2,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: cGrey_400, width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(6),
                                        ),
                                      ),
                                      child: emptyDataSetTitle(
                                        "Silahkan Filter untuk menampilkan data\nLaporan Jamsostek.",
                                      ),
                                    ),
                                  ),
                                )
                              : cardListKantor()
                      : cardListKantor()
            ],
          ),
        ),
      ),
    );
  }

  Expanded cardListKantor() {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: jamsostekC.jamsostekKantorM!.data.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var data = jamsostekC.jamsostekKantorM!.data;
          if (index < jamsostekC.jamsostekKantorM!.data.length) {
            return cardItemsKantor(
              index + 1,
              data[index].namaKaryawan,
              data[index].nip,
              data[index].perhitungan.jkk,
              data[index].perhitungan.jht,
              data[index].perhitungan.jkm,
              double.parse(data[index]
                      .perhitungan
                      .jkk
                      .replaceAll(".", "")
                      .replaceAll(",", ".")) +
                  double.parse(data[index]
                      .perhitungan
                      .jht
                      .replaceAll(".", "")
                      .replaceAll(",", ".")) +
                  double.parse(data[index]
                      .perhitungan
                      .jkm
                      .replaceAll(".", "")
                      .replaceAll(",", ".")),
              data[index].perhitungan.jp1,
              data[index].perhitungan.jp2,
              data[index].perhitungan.totalJp,
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: !jamsostekC.isEmptyData2.value
                    ? const CircularProgressIndicator()
                    : Text(
                        "Tidak ada data lagi.",
                        style: customTextStyle(FontWeight.w400, 15, cGrey_900),
                      ),
              ),
            );
          }
        },
      ),
    );
  }

  Container cardCountData() {
    return Container(
      width: Get.width,
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          shadowMedium,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Jumlah :",
              style: customTextStyle(FontWeight.w600, 17, cGrey_900),
            ),
            Text(
              FormatCurrency.convertToIdr(jamsostekC.totalKeseluruhan.value, 0),
              style: customTextStyle(FontWeight.w800, 17, cPrimary),
            )
          ],
        ),
      ),
    );
  }

  Padding cardItemsKeseluruhan(
      no, nama, nip, jmlKaryawan, jkk, jht, jkm, total, jp1, jp2, totalJp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: cGrey_400),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: cPrimary_300,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                no.toString(),
                                style: customTextStyle(
                                  FontWeight.w800,
                                  16,
                                  cPrimary,
                                ),
                              ),
                            ),
                          ),
                          spaceWidth(10),
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shortenLastName(nama),
                                  style: customTextStyle(
                                    FontWeight.w700,
                                    14,
                                    Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  nip,
                                  style: customTextStyle(
                                    FontWeight.w600,
                                    12,
                                    cGrey_700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  jmlKaryawan != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Jml Karyawan",
                              style: customTextStyle(
                                FontWeight.w500,
                                12,
                                cGrey_700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              jmlKaryawan,
                              style: customTextStyle(
                                FontWeight.w700,
                                14,
                                cPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
              spaceHeight(10),
              Container(
                width: Get.width,
                height: 1,
                color: cGrey_400,
              ),
              spaceHeight(10),
              InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'JAMSOSTEK - ${shortenLastName(nama)}',
                        style:
                            customTextStyle(FontWeight.w600, 14, Colors.black),
                      ),
                      content: SizedBox(
                        width: Get.width,
                        height: 105,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JKK',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          jkk,
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  spaceWidth(5),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JHT',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          jht,
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              spaceHeight(15),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JKM',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          jkm,
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  spaceWidth(5),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          FormatCurrency.convertToIdrNoRp(
                                              total, 0),
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        InkWell(
                          splashColor: cPrimary,
                          onTap: () => Get.back(),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: cPrimary, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: cPrimary),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: cPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                      child: Text(
                        "Detail Jamsostek",
                        style:
                            customTextStyle(FontWeight.w500, 11, Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              spaceHeight(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JP(1%)",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            jp1,
                            style: customTextStyle(
                              FontWeight.w800,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceWidth(5),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JP(2%)",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            jp2,
                            style: customTextStyle(
                              FontWeight.w800,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceWidth(5),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total JP",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            totalJp,
                            style: customTextStyle(
                              FontWeight.w800,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding cardItemsKantor(
      no, nama, nip, jkk, jht, jkm, total, jp1, jp2, totalJp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: cGrey_400),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: cPrimary_300,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                no.toString(),
                                style: customTextStyle(
                                  FontWeight.w800,
                                  16,
                                  cPrimary,
                                ),
                              ),
                            ),
                          ),
                          spaceWidth(10),
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shortenLastName(nama),
                                  style: customTextStyle(
                                    FontWeight.w700,
                                    14,
                                    Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  nip,
                                  style: customTextStyle(
                                    FontWeight.w600,
                                    12,
                                    cGrey_700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              spaceHeight(10),
              Container(
                width: Get.width,
                height: 1,
                color: cGrey_400,
              ),
              spaceHeight(10),
              InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'JAMSOSTEK - ${shortenLastName(nama)}',
                        style:
                            customTextStyle(FontWeight.w600, 14, Colors.black),
                      ),
                      content: SizedBox(
                        width: Get.width,
                        height: 105,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JKK',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          jkk,
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  spaceWidth(5),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JHT',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          jht,
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              spaceHeight(15),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JKM',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          jkm,
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  spaceWidth(5),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total',
                                          style: customTextStyle(
                                              FontWeight.w400,
                                              12,
                                              Colors.black),
                                        ),
                                        Text(
                                          FormatCurrency.convertToIdrNoRp(
                                              total, 2),
                                          style: customTextStyle(
                                              FontWeight.w700,
                                              13,
                                              Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        InkWell(
                          splashColor: cPrimary,
                          onTap: () => Get.back(),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: cPrimary, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: cPrimary),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: cPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                      child: Text(
                        "Detail Jamsostek",
                        style:
                            customTextStyle(FontWeight.w500, 11, Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              spaceHeight(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JP(1%)",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            jp1,
                            style: customTextStyle(
                              FontWeight.w800,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceWidth(5),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JP(2%)",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            jp2,
                            style: customTextStyle(
                              FontWeight.w800,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceWidth(5),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total JP",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            totalJp,
                            style: customTextStyle(
                              FontWeight.w800,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget formSelectKategori() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHeight(6),
        InkWell(
          onTap: () => setState(() {
            isActive = !isActive;
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kategori",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_700,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: cPrimary_500,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    isActive ? "Show Menu" : "Hide Menu",
                    style: customTextStyle(
                      FontWeight.w500,
                      10,
                      Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: Get.width,
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: DropdownButtonFormField<String>(
              hint: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Pilih Kategori",
                ),
              ),
              isDense: true,
              isExpanded: true,
              value: dropdownValueKat,
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
                  dropdownValueKat = newValue!;
                });
              },
              items: <String>['Rekap Keseluruhan', 'Rekap Kantor Cabang']
                  .map<DropdownMenuItem<String>>((String values) {
                return DropdownMenuItem<String>(
                  value: values,
                  child: Text(
                    values,
                    style: customTextStyle(
                      FontWeight.w500,
                      15,
                      cGrey_900,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget formSelectKantor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kantor",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            )),
        spaceHeight(4),
        Container(
          width: Get.width,
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: DropdownButtonFormField<String>(
              hint: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Pilih Kantor"),
              ),
              isDense: true,
              isExpanded: true,
              value: dropdownValueKantor,
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
                  dropdownValueKantor = newValue!;
                });
                if (dropdownValueKantor == "Cabang") {
                  cabangC.cabangM?.data.clear();
                  cabangC.getCabang();
                }
              },
              items: <String>['Pusat', 'Cabang']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: customTextStyle(
                      FontWeight.w500,
                      15,
                      cGrey_900,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget formSelectMonth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bulan",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            )),
        spaceHeight(4),
        Container(
          width: Get.width,
          height: 65,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: DropdownButtonFormField<String>(
              hint: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Pilih Bulan"),
              ),
              isDense: true,
              isExpanded: true,
              value: dropdownValueMonth,
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
                  dropdownValueMonth = newValue!;
                  jamsostekC.bulan.value = newValue;
                });
              },
              items: listBulan.bulan.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value['type'],
                  child: Text(
                    value['nama'],
                    style: customTextStyle(
                      FontWeight.w500,
                      15,
                      cGrey_900,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget formSelectCabang() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cabang",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            ),
          ),
          spaceHeight(4),
          DropdownButtonFormField<String>(
            hint: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Pilih Cabang"),
            ),
            isDense: true,
            isExpanded: true,
            value: kdCabang,
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
                kdCabang = newValue!;
              });
            },
            items: cabangC.cabangM?.data.map<DropdownMenuItem<String>>((item) {
              return DropdownMenuItem<String>(
                value: item.kdCabang,
                child: Text(
                  "${item.kdCabang} - ${item.namaCabang}",
                  style: customTextStyle(
                    FontWeight.w500,
                    15,
                    cGrey_900,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
