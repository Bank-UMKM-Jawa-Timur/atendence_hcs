import 'package:atendence_hcs/http/models/SDM/masa_pensiun/data_masa_pensiun_model.dart';
import 'package:atendence_hcs/http/models/SDM/masa_pensiun/divisi_model.dart'
    as diviModel;
import 'package:atendence_hcs/http/models/SDM/masa_pensiun/sub_divisi_model.dart'
    as subDivisModel;
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/bagian_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/data_masa_pensiun_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/divisi_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/list_masa_pensiun_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/controllers/sub_divis_controller.dart';
import 'package:atendence_hcs/src/futures/SDM/data_masa_pensiun/views/components/row_items.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/my_snacbar.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataMasaPensiunPage extends StatefulWidget {
  const DataMasaPensiunPage({super.key});

  @override
  State<DataMasaPensiunPage> createState() => _DataMasaPensiunPageState();
}

class _DataMasaPensiunPageState extends State<DataMasaPensiunPage> {
  DivisiController divisC = Get.find<DivisiController>();
  SubDivisiController subDivisiC = Get.find<SubDivisiController>();
  BagianController bagianC = Get.find<BagianController>();
  ListMasaPensiunController listMasaPensiunC =
      Get.find<ListMasaPensiunController>();
  DataMasaPensiunController dataMasaPensiunC =
      Get.find<DataMasaPensiunController>();
  int page = 1;
  final controller = ScrollController();
  bool loadMore = false;
  bool hasMore = true;

  String? valueKat;
  String? valueDivisi;
  String? valueSubDivisi;
  String? valueBagian;
  String? valueKantor;

  List kategori = [
    {'name': 'Keseluruhan'},
    {'name': 'Divisi'},
    {'name': 'Sub Divisi'},
    {'name': 'Bagian'},
    {'name': 'Kantor'},
  ];

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
    loadMore = true;
    setState(() {
      page++;
    });
    if (dataMasaPensiunC.isEmptyData.value) {
      hasMore = false;
    } else {
      hasMore = true;
      dataMasaPensiunC.getDataMasaPensiun(kategori, page);
    }
    loadMore = false;
    setState(() {});
  }

  filter() {
    setState(() {
      page = 1;
    });
    if (dataMasaPensiunC.isFilter.value) {
      dataMasaPensiunC.dataMasaPensiunM!.data.clear();
      dataMasaPensiunC.isActiveList!.clear();
    }
    dataMasaPensiunC.getDataMasaPensiun(valueKat, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Data Masa Pensiun"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              width: Get.width,
              // height: Get.height,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cGrey_400, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Column(
                children: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          dropdownKategori(),
                          // show dropDown Divis
                          listMasaPensiunC.showDiv.value
                              ? divisC.isLoading.value
                                  ? loadingPage()
                                  : dropdownDivisi(divisC.divisiM!.data)
                              : Container(),

                          // show dropDown Sub Divis
                          subDivisiC.emptyData.value
                              ? Container()
                              : listMasaPensiunC.showSubDiv.value
                                  ? subDivisiC.isLoading.value
                                      ? loadingPage()
                                      : dropdownSubDivisi()
                                  : Container(),

                          // show dropDown Bagian
                          bagianC.emptyData.value
                              ? Container()
                              : listMasaPensiunC.bagian.value
                                  ? bagianC.isLoading.value
                                      ? loadingPage()
                                      : dropdownBagian(bagianC.bagianM!.data)
                                  : Container(),

                          // Button filter
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
                                if (valueKat == null) {
                                  snackbarfailed("Kategori Harap Dipilih!.");
                                } else {
                                  if (valueKat == "Keseluruhan") {
                                    filter();
                                  } else if (valueKat == "Divisi") {
                                    valueDivisi == null
                                        ? snackbarfailed("Divisi Harap di isi.")
                                        : filter();
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cPrimary,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    CommunityMaterialIcons.filter_outline,
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
                    ),
                  )
                ],
              ),
            ),
            spaceHeight(10),
            Expanded(
              child: Obx(
                () => page == 1
                    ? dataMasaPensiunC.isLoading.value
                        ? loadingPage()
                        : dataMasaPensiunC.isEmptyData.value
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: cGrey_400, width: 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                                child: emptyDataSetTitle(
                                  dataMasaPensiunC.isFilter.value
                                      ? "Data yang anda filter kosong!."
                                      : "Pilih Kategori untuk menampilkan data.",
                                ),
                              )
                            : dataList()
                    : dataList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView dataList() {
    return ListView.builder(
      controller: controller,
      itemCount: dataMasaPensiunC.dataMasaPensiunM!.data.length + 1,
      // : dataMasaPensiunC
      //     .dataMasaPensiunM!.data.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var data = dataMasaPensiunC.dataMasaPensiunM?.data;
        if (index < dataMasaPensiunC.dataMasaPensiunM!.data.length) {
          return Container(
            width: Get.width,
            // height: Get.height,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: cGrey_400, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: cardData(
              index,
              data?[index].nip,
              data?[index].namaKaryawan,
              data?[index].displayJabatan.trim() ?? '-',
              data?[index].kantor ?? '-',
              "Gol -",
              data?[index].tglLahir ?? '-',
              'Umur -',
              data?[index].jk ?? '-',
              data?[index].statusJabatan ?? '-',
              'Status -',
              data?[index].tanggalPengangkat ?? '-',
              "masaKerja -",
              'pendidikan belum',
              data?[index].pensiun ?? "-",
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: hasMore
                  ? const CircularProgressIndicator()
                  : Text(
                      "Data Kosong!",
                      style: customTextStyle(FontWeight.w600, 15, cGrey_900),
                    ),
            ),
          );
        }
      },
    );
  }

  Padding dropdownSubDivisi() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sub Divisi",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            // value: skemaKreditController.valueSkemaKredit,
            value: valueSubDivisi,
            hint: Text(
              valueSubDivisi ?? "-- pilih Sub Divisi --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueSubDivisi = value;
                  dataMasaPensiunC.valSubDivisi.value = value!;
                  if (listMasaPensiunC.bagian.value) {
                    bagianC.getBagian(valueSubDivisi);
                  }
                  if (valueBagian != null) {
                    bagianC.bagianM!.data.clear();
                    valueBagian = null;
                  }
                });
              }
            }),
            items: subDivisiC.subdivisiM?.data
                .map<DropdownMenuItem<String>>((item) {
              return DropdownMenuItem(
                child: Text(
                  item.kdSubdiv + " - " + item.namaSubdivisi,
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item.kdSubdiv,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Container cardData(
    index,
    nip,
    nama,
    jabatan,
    kantor,
    gol,
    tglLahir,
    umur,
    jk,
    status,
    skAngkat,
    tglAngkat,
    masaKerja,
    pendidikanTerakhir,
    status2,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: cGrey_300, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                dataMasaPensiunC.isActiveList![index] =
                    !dataMasaPensiunC.isActiveList![index];
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: cPrimary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: customTextStyle(
                              FontWeight.w700,
                              10,
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                      spaceWidth(7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shortenLastName(nama),
                            style: customTextStyle(
                              FontWeight.w700,
                              11,
                              Colors.black,
                            ),
                          ),
                          Text(
                            nip,
                            style: customTextStyle(
                              FontWeight.w600,
                              10,
                              cGrey_600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: cGrey_600,
                  )
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.linear,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: 1,
                  color: cGrey_300,
                ),
                dataMasaPensiunC.isActiveList![index]
                    ? Column(
                        children: [
                          spaceHeight(10),
                          row1(jabatan, kantor, gol),
                          row2(tglLahir, umur, jk),
                          row3(status, skAngkat, tglAngkat),
                          row4(masaKerja, pendidikanTerakhir, status2),
                          spaceHeight(20),
                        ],
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding dropdownKategori() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kategori",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            // value: skemaKreditController.valueSkemaKredit,
            value: valueKat,
            hint: Text(
              "-- pilih Kategori --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueKat = value as String?;
                  listMasaPensiunC.kategori.value = value as String;
                  listMasaPensiunC.changeValDropdown();
                  if (listMasaPensiunC.showDiv.value) {
                    divisC.getDivisi();
                  }
                });
              }
            }),
            items: kategori.map((item) {
              return DropdownMenuItem(
                child: Text(
                  item['name'],
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item['name'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Padding dropdownDivisi(List<diviModel.Datum> data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Divisi",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            // value: skemaKreditController.valueSkemaKredit,
            value: valueDivisi,
            hint: Text(
              valueDivisi ?? "-- pilih Divisi --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueDivisi = value;
                  dataMasaPensiunC.valDivisi.value = value!;
                  if (listMasaPensiunC.showSubDiv.value) {
                    subDivisiC.getSubDivisi(valueDivisi);
                  }
                  if (valueSubDivisi != null) {
                    subDivisiC.subdivisiM!.data.clear();
                    valueSubDivisi = null;
                  }
                  if (valueKat == "Bagian") {
                    if (valueBagian != null) {
                      bagianC.bagianM!.data.clear();
                      valueBagian == null;
                    }
                  }
                });
              }
            }),
            items: data.map((item) {
              return DropdownMenuItem(
                child: Text(
                  item.kdDivisi + " - " + item.namaDivisi,
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item.kdDivisi,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Padding dropdownBagian(List<dynamic> data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bagian",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            value: valueBagian,
            hint: Text(
              "-- pilih Bagian --",
              style: customTextStyle(
                FontWeight.w600,
                12,
                cGrey_600,
              ),
            ),
            onChanged: ((value) {
              if (mounted) {
                setState(() {
                  valueBagian = value;
                  dataMasaPensiunC.valBagian.value = value!;
                });
              }
            }),
            items: bagianC.bagianM?.data.map((item) {
              return DropdownMenuItem(
                child: Text(
                  item.kdBagian + " - " + item.namaBagian,
                  style: customTextStyle(
                    FontWeight.w500,
                    12,
                    cGrey_900,
                  ),
                ),
                value: item.kdBagian,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
