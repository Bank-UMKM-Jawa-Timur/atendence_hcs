import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/pejabat_sementara/controllers/pejabat_sementara_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PejabatSementaraPage extends StatefulWidget {
  const PejabatSementaraPage({super.key});

  @override
  State<PejabatSementaraPage> createState() => _PejabatSementaraPageState();
}

class _PejabatSementaraPageState extends State<PejabatSementaraPage> {
  PejabatSementaraController pjsC = Get.find<PejabatSementaraController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  var page = 1;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    pjsC.getListPjs(nip, page);
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
    pjsC.getListPjs(nip, page);
    setState(() {});
  }

  clearData() {
    page = 1;
    pjsC.pjsModel?.data.clear();
    setState(() {});
    pjsC.getListPjs(nip, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: AppBar(
        title: const Text(
          "Pejabat Sementara",
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
      body: Column(
        children: [
          Container(
            width: Get.width,
            color: cPrimary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    RouteNames.searchKaryawan,
                    arguments: RouteNames.pejabatSementara,
                  );
                },
                child: Container(
                  width: Get.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
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
            ),
          ),
          Obx(
            () => page == 1
                ? pjsC.isLoading.value
                    ? loadingPage()
                    : pjsC.isEmptyData.value
                        ? emtyPage(
                            "Hasil Pejabat Sementara untuk\n$nama Masih Kosong!.")
                        : cardDataItems()
                : cardDataItems(),
          ),
        ],
      ),
    );
  }

  Expanded cardDataItems() {
    return Expanded(
      child: RefreshIndicator(
        color: Colors.white,
        backgroundColor: cPrimary,
        onRefresh: () async {
          clearData();
        },
        child: ListView.builder(
          controller: controller,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: pjsC.pjsModel!.data.length,
          itemBuilder: (context, index) {
            if (index + 1 < pjsC.pjsModel!.data.length) {
              return cardItems(
                index + 1,
                pjsC.pjsModel!.data[index].nip,
                pjsC.pjsModel!.data[index].namaKaryawan,
                pjsC.pjsModel!.data[index].displayJabatan,
                pjsC.pjsModel?.data[index].tanggalMulai
                    .fullDateAll()
                    .toString(),
                pjsC.pjsModel!.data[index].tanggalBerakhir ?? '-',
                pjsC.pjsModel!.data[index].statusPjs ?? '-',
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: !pjsC.isEmptyData.value
                      ? const CircularProgressIndicator()
                      : Text(
                          "Tidak ada data lagi.",
                          style:
                              customTextStyle(FontWeight.w400, 15, cGrey_900),
                        ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Padding cardItems(
    int no,
    nip,
    nama,
    pejabatBPJ,
    mulai,
    berakhir,
    type,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
              Radius.circular(15),
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
                                shortenLastName(nama),
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
                                    nip,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 3.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pejabat BPJ",
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
                    spaceWidth(10),
                    SizedBox(
                      width: Get.width / 2.25,
                      child: Text(
                        pejabatBPJ,
                        style: customTextStyle(
                          FontWeight.w800,
                          12,
                          cGrey_600,
                        ),
                        textAlign: TextAlign.start,
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
                      width: Get.width / 3.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mulai",
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
                    spaceWidth(10),
                    SizedBox(
                      width: Get.width / 2.25,
                      child: Text(
                        mulai,
                        style: customTextStyle(
                          FontWeight.w800,
                          12,
                          cGrey_600,
                        ),
                        textAlign: TextAlign.start,
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
                      width: Get.width / 3.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Berakhir",
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
                    spaceWidth(10),
                    SizedBox(
                      width: Get.width / 2.25,
                      child: Text(
                        berakhir != "-"
                            ? DateTime.parse(berakhir).fullDateAll().toString()
                            : berakhir,
                        style: customTextStyle(
                          FontWeight.w800,
                          12,
                          cGrey_600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                spaceHeight(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
