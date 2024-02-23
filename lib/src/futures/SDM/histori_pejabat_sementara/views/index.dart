import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/histori_pejabat_sementara/controllers/histori_pjs_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoriPejabatSementara extends StatefulWidget {
  const HistoriPejabatSementara({super.key});

  @override
  State<HistoriPejabatSementara> createState() =>
      _HistoriPejabatSementaraState();
}

class _HistoriPejabatSementaraState extends State<HistoriPejabatSementara> {
  HistoriPjsController historiPjsC = Get.find<HistoriPjsController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  String dropdownValue = "Aktif";

  @override
  void initState() {
    super.initState();
    if (nip != "") {
      dropdownValue = "Karyawan";
      historiPjsC.valKategori.value = "Karyawan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: AppBar(
        title: const Text(
          "Histori Pejabat Sementara",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: cPrimary,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    selectKategori(),
                    nip == ""
                        ? dropdownValue == "Karyawan"
                            ? searchKaryawan()
                            : Container()
                        : searchKaryawan(),
                    spaceHeight(7),
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
                          historiPjsC.getHistoriPjs(nip);
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
            Obx(
              () => historiPjsC.isLoading.value
                  ? loadingPage()
                  : historiPjsC.isEmptyData.value
                      ? Container(
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
                      : Expanded(
                          child: RefreshIndicator(
                            color: Colors.white,
                            backgroundColor: cPrimary,
                            onRefresh: () => historiPjsC.getHistoriPjs(nip),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount:
                                  historiPjsC.historiPjsM?.data.length ?? 0,
                              itemBuilder: (context, index) {
                                return cardItems(
                                  index + 1,
                                  historiPjsC.historiPjsM!.data[index].nip ??
                                      '-',
                                  historiPjsC
                                      .historiPjsM!.data[index].displayJabatan,
                                  historiPjsC
                                      .historiPjsM?.data[index].tanggalMulai
                                      .fullDateAll()
                                      .toString(),
                                  historiPjsC.historiPjsM!.data[index]
                                          .tanggalBerakhir ??
                                      '-',
                                  historiPjsC.historiPjsM!.data[index].status ??
                                      '-',
                                );
                              },
                            ),
                          ),
                        ),
            )
            // Container(
            //   width: Get.width,
            //   height: Get.height / 2,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: cGrey_400, width: 1),
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(6),
            //     ),
            //   ),
            //   child: emptyDataSetTitle(
            //       "Silahkan Cari Karyawan untuk\nmenampilkan data."),
            // )
          ],
        ),
      ),
    );
  }

  InkWell searchKaryawan() {
    return InkWell(
      onTap: () {
        Get.toNamed(
          RouteNames.searchKaryawan,
          arguments: RouteNames.historiPejabatSementara,
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
          border: Border.all(color: cGrey_700, width: 1),
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
            historiPjsC.valKategori.value = newValue;
          });
        },
        items: <String>['Aktif', 'Karyawan']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget cardItems(int no, nipK, pejabatBPJ, mulai, berakhir, type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          // Get.toNamed(
          //   RouteNames.detailKaryawan,
          //   arguments: Get.arguments[0]['nip'],
          // );
        },
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
                              // shortTwoCaracterName(nama),
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
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nama,
                                style: customTextStyle(
                                  FontWeight.w700,
                                  14,
                                  Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              spaceHeight(2),
                              Row(
                                children: [
                                  Text(
                                    nipK,
                                    style: customTextStyle(
                                      FontWeight.w600,
                                      12,
                                      cGrey_700,
                                    ),
                                  ),
                                  spaceWidth(10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: type == "Aktif"
                                          ? cGreen_500
                                          : cRed_300,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 1,
                                        horizontal: 5,
                                      ),
                                      child: Text(
                                        type,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  )
                                ],
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
                              "Pejabat BPJ",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              pejabatBPJ,
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
                              "Mulai",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              mulai,
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
                              "Berakhir",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              berakhir != "-"
                                  ? DateTime.parse(berakhir)
                                      .fullDateAll()
                                      .toString()
                                  : berakhir,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
