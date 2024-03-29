import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_surat_peringatan/controllers/histori_sp_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_datepicker.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoriSuratPeringatan extends StatefulWidget {
  const HistoriSuratPeringatan({super.key});

  @override
  State<HistoriSuratPeringatan> createState() => _HistoriSuratPeringatanState();
}

class _HistoriSuratPeringatanState extends State<HistoriSuratPeringatan> {
  HistoriSpController historiSpC = Get.find<HistoriSpController>();
  final controller = ScrollController();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  String dropdownValue = "Semua Data";
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  DateTime year = DateTime.now();
  int page = 1;
  bool loadMore = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    if (nip != "") {
      dropdownValue = "Karyawan";
      historiSpC.kategori.value = "Karyawan";
    }

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  Future<void> fetch() async {
    loadMore = true;
    setState(() {
      page++;
    });
    if (historiSpC.isEmptyData.value) {
      hasMore = false;
    } else {
      await historiSpC.getHistoriSp(nip, firstDate, lastDate, year, page);
    }
    loadMore = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Histori Surat Peringatan"),
      body: Obx(
        () => Padding(
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
                      dropdownValue == "Karyawan"
                          ? searchKaryawan()
                          : Container(),
                      dropdownValue == "Tanggal"
                          ? Column(
                              children: [
                                formFirstDate(context),
                                formLastDate(context),
                              ],
                            )
                          : Container(),
                      dropdownValue == "Tahun"
                          ? formDateYear(context)
                          : Container(),
                      spaceHeight(10),
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
                            setState(() {
                              page = 1;
                            });
                            historiSpC.historiSpM?.data.clear();
                            historiSpC.typeFilter.value = true;
                            historiSpC.getHistoriSp(
                                nip, firstDate, lastDate, year, page);
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
              ),
              spaceHeight(10),
              historiSpC.typeFilter.value
                  ? page == 1
                      ? historiSpC.isLoading.value
                          ? loadingPage()
                          : historiSpC.isEmptyData.value
                              ? widgetEmptyFilter()
                              : cardListData()
                      : cardListData()
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Container(
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
                            "Silahkan Filter untuk menampilkan data\nHistori Surat Peringatan.",
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Expanded cardListData() {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: loadMore
            ? historiSpC.historiSpM!.data.length + 1
            : historiSpC.historiSpM!.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index < historiSpC.historiSpM!.data.length) {
            var data = historiSpC.historiSpM?.data;
            return cardItems(
              index + 1,
              data?[index].nip ?? '-',
              data?[index].namaKaryawan ?? '-',
              data?[index].noSp ?? '-',
              data?[index].tanggalSp.toString() ?? '-',
              data?[index].pelanggaran ?? '-',
              data?[index].sanksi ?? '-',
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Center(
                child: historiSpC.isEmptyData.value
                    ? const Text("Tidak Ada Data Lagi!.")
                    : const CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Expanded widgetEmptyFilter() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
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
            "Data yang anda filter masih kosong!.",
          ),
        ),
      ),
    );
  }

  Column formFirstDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHeight(7),
        Text(
          "Tanggal Awal",
          style: customTextStyle(
            FontWeight.w600,
            12,
            cGrey_900,
          ),
        ),
        spaceHeight(4),
        InkWell(
          onTap: () async {
            if (GetPlatform.isAndroid) {
              final date = await datePicker(context, DateTime.now());
              if (mounted) {
                setState(() {
                  firstDate = date ?? DateTime.now();
                });
              }
            } else if (GetPlatform.isIOS) {
              showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                  height: 400,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            maximumYear: DateTime.now().year,
                            minimumYear: 2023,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (val) {
                              setState(() {
                                firstDate = val;
                              });
                            }),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          child: Container(
            width: Get.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_600, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(firstDate.simpleDate().toString()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column formLastDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHeight(7),
        Text(
          "Tanggal Akhir",
          style: customTextStyle(
            FontWeight.w600,
            12,
            cGrey_900,
          ),
        ),
        spaceHeight(4),
        InkWell(
          onTap: () async {
            if (GetPlatform.isAndroid) {
              final date = await datePicker(context, DateTime.now());
              if (mounted) {
                setState(() {
                  lastDate = date ?? DateTime.now();
                });
              }
            } else if (GetPlatform.isIOS) {
              showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                  height: 400,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            maximumYear: DateTime.now().year,
                            minimumYear: 2023,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (val) {
                              setState(() {
                                lastDate = val;
                              });
                            }),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          child: Container(
            width: Get.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_600, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(lastDate.simpleDate().toString()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column formDateYear(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHeight(2),
        Text(
          "Tahun",
          style: customTextStyle(
            FontWeight.w600,
            12,
            cGrey_900,
          ),
        ),
        spaceHeight(4),
        InkWell(
          onTap: () async {
            if (GetPlatform.isAndroid) {
              if (mounted) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        "Pilih Tahun",
                        style: customTextStyle(FontWeight.w500, 17, cPrimary),
                      ),
                      surfaceTintColor: Colors.white,
                      content: SizedBox(
                        width: 300,
                        height: 300,
                        child: YearPicker(
                          firstDate: DateTime(2023),
                          lastDate: DateTime.now(),
                          selectedDate: year,
                          initialDate: DateTime.now(),
                          onChanged: (value) {
                            setState(() {
                              year = value;
                            });
                            Get.back();
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            } else if (GetPlatform.isIOS) {
              showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                  height: 400,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            minimumDate: DateTime(2023),
                            mode: CupertinoDatePickerMode.monthYear,
                            onDateTimeChanged: (val) {
                              setState(() {
                                year = val;
                              });
                            }),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          child: Container(
            width: Get.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_600, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(year.getYear().toString()),
                ),
              ],
            ),
          ),
        ),
      ],
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
            historiSpC.kategori.value = newValue;
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

  Widget searchKaryawan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Karyawan",
          style: customTextStyle(
            FontWeight.w600,
            12,
            cGrey_900,
          ),
        ),
        spaceHeight(4),
        InkWell(
          onTap: () {
            Get.toNamed(
              RouteNames.searchKaryawan,
              arguments: RouteNames.historiSuratPeringatan,
            );
          },
          child: Container(
            width: Get.width,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_600, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
        ),
      ],
    );
  }

  Padding cardItems(no, nip, name, noSp, tglSp, pelanggaran, sanksi) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: cGrey_400,
              blurRadius: 4,
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
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
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shortenLastName(name),
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
              spaceHeight(15),
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
                            "Nomor SP",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            noSp,
                            style: customTextStyle(
                              FontWeight.w700,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceWidth(10),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal SP",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            DateTime.parse(tglSp).fullDateAll().toString(),
                            style: customTextStyle(
                              FontWeight.w700,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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
                            "Pelanggaran",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            pelanggaran,
                            style: customTextStyle(
                              FontWeight.w700,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sanksi",
                            style: customTextStyle(
                              FontWeight.w600,
                              12,
                              cGrey_700,
                            ),
                          ),
                          Text(
                            sanksi,
                            style: customTextStyle(
                              FontWeight.w700,
                              13,
                              cGrey_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
