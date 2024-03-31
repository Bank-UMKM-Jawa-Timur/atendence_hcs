import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/controllers/list_penghasilan_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_border.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProsesPenghasilan extends StatefulWidget {
  const ProsesPenghasilan({super.key});

  @override
  State<ProsesPenghasilan> createState() => _ProsesPenghasilanState();
}

class _ProsesPenghasilanState extends State<ProsesPenghasilan> {
  ListPenghasilanController penghasilanC =
      Get.find<ListPenghasilanController>();
  String valueKategori = "Proses";
  final controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();

    penghasilanC.getListPenghasilan(valueKategori, page);
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
    penghasilanC.getListPenghasilan(valueKategori, page);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Proses Penghasilan"),
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
                  child: formSelectKantor(),
                ),
              ),
              spaceHeight(10),
              page == 1
                  ? penghasilanC.isLoading.value
                      ? loadingPage()
                      : penghasilanC.isEmptyData.value
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
                                    "Proses $valueKategori Penghasilan Masih Kosong.",
                                  ),
                                ),
                              ),
                            )
                          : itemsDynamis()
                  : itemsDynamis()
            ],
          ),
        ),
      ),
    );
  }

  Expanded itemsDynamis() {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: penghasilanC.penghasilanM!.data.length + 1,
        itemBuilder: (context, index) {
          var data = penghasilanC.penghasilanM!.data;
          if (index < penghasilanC.penghasilanM!.data.length) {
            return cardItems(
              index,
              data[index].id,
              data[index].kategori,
              data[index].kantor,
              data[index].tanggal.simpleDateRevers().toString(),
              data[index].bulan,
              data[index].tahun,
              FormatCurrency.convertToIdr(data[index].bruto, 0).toString(),
              FormatCurrency.convertToIdr(data[index].totalPotongan, 0)
                  .toString(),
              FormatCurrency.convertToIdr(data[index].netto, 0).toString(),
              FormatCurrency.convertToIdr(data[index].totalPph, 0).toString(),
              FormatCurrency.convertToIdr(data[index].totalPajakInsentif, 0)
                  .toString(),
              FormatCurrency.convertToIdr(data[index].hasilPph, 0).toString(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: !penghasilanC.isEmptyData.value
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

  Widget cardItems(
    index,
    id,
    kategori,
    kantor,
    tanggal,
    bulan,
    tahun,
    bruto,
    potongan,
    netto,
    pphBentukan,
    pajakInsentif,
    pph21,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteNames.detailPenghasilan, arguments: id);
        },
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
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: cPrimary_300,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kategori + " ($kantor)",
                                style: customTextStyle(
                                  FontWeight.w700,
                                  14,
                                  Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "$bulan $tahun | $tanggal",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  12,
                                  cGrey_900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Detail",
                          style: customTextStyle(
                            FontWeight.w500,
                            13,
                            cGrey_700,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: cGrey_700,
                        )
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bruto",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  12,
                                  cGrey_900,
                                ),
                              ),
                              Text(
                                ":",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  13,
                                  cBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          bruto,
                          style: customTextStyle(
                            FontWeight.w800,
                            12,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Potongan",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  12,
                                  cGrey_900,
                                ),
                              ),
                              Text(
                                ":",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  13,
                                  cBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          potongan,
                          style: customTextStyle(
                            FontWeight.w800,
                            12,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Netto",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  12,
                                  cGrey_900,
                                ),
                              ),
                              Text(
                                ":",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  13,
                                  cBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          netto,
                          style: customTextStyle(
                            FontWeight.w800,
                            12,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "PPH Bentukan",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  12,
                                  cGrey_900,
                                ),
                              ),
                              Text(
                                ":",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  13,
                                  cBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          pphBentukan,
                          style: customTextStyle(
                            FontWeight.w800,
                            12,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pajak Insentif",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  12,
                                  cGrey_900,
                                ),
                              ),
                              Text(
                                ":",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  13,
                                  cBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          pajakInsentif,
                          style: customTextStyle(
                            FontWeight.w800,
                            12,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width / 2.5,
                                child: Text(
                                  "PPh21 (PPh Bentukan - Pajak Insentif)",
                                  style: customTextStyle(
                                    FontWeight.w600,
                                    12,
                                    cGrey_900,
                                  ),
                                ),
                              ),
                              Text(
                                ":",
                                style: customTextStyle(
                                  FontWeight.w600,
                                  13,
                                  cBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          pph21,
                          style: customTextStyle(
                            FontWeight.w800,
                            12,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                spaceHeight(5)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formSelectKantor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Status",
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_700,
            )),
        spaceHeight(4),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: DropdownButtonFormField<String>(
              hint: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(valueKategori),
              ),
              isDense: true,
              isExpanded: true,
              value: valueKategori,
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
                  valueKategori = newValue!;
                });
                penghasilanC.penghasilanM?.data.clear();
                penghasilanC.getListPenghasilan(valueKategori, page);
              },
              items: ['Proses', 'Final'].map<DropdownMenuItem<String>>((value) {
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
        )
      ],
    );
  }
}
