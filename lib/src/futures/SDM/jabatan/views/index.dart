import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/jabatan/controllers/jabatan_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jabatan extends StatefulWidget {
  const Jabatan({super.key});

  @override
  State<Jabatan> createState() => _JabatanState();
}

class _JabatanState extends State<Jabatan> {
  HistoriJabatanController jabatanC = Get.find<HistoriJabatanController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];

  @override
  void initState() {
    super.initState();
    if (nip != "") {
      jabatanC.getJabatan(nip);
    }
  }

  List listInput = [
    {
      'title': "Status Jabatan",
      'value': "-",
    },
    {
      'title': "Pangkat dan Golongan Sekarang ",
      'value': "-",
    },
    {
      'title': "Jabatan Sekarang",
      'value': "-",
    },
    {
      'title': "Kantor Sekarang",
      'value': "-",
    },
  ];

  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: AppBar(
        title: const Text(
          "Histori Jabatan",
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
      body: RefreshIndicator(
        backgroundColor: cPrimary,
        color: Colors.white,
        onRefresh: () => jabatanC.getJabatan(nip),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                  child: Container(
                    width: Get.width,
                    // height: Get.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: cGrey_400, width: 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          searchKaryawan(),
                          Obx(
                            () => isShow
                                ? ListView.builder(
                                    itemCount: jabatanC.isEmptyData.value
                                        ? listInput.length
                                        : jabatanC.listInput.length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => jabatanC
                                            .isEmptyData.value
                                        ? inputData(
                                            listInput[index]['title'],
                                            listInput[index]['value'],
                                          )
                                        : inputData(
                                            jabatanC.listInput[index]['title'],
                                            jabatanC.listInput[index]['value'],
                                          ))
                                : Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                spaceHeight(10),
                nip == ""
                    ? Container(
                        width: Get.width,
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
                    : Obx(
                        () => jabatanC.isLoading.value
                            ? loadingPage()
                            : jabatanC.isEmptyData.value
                                ? Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: cGrey_400, width: 1),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: emptyData("Histori Jabaran $nama"),
                                    ),
                                  )
                                : SizedBox(
                                    height:
                                        (jabatanC.jabatanM?.data.length ?? 0) *
                                            200,
                                    child: ListView.builder(
                                      itemCount:
                                          jabatanC.jabatanM?.data.length ?? 0,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          cardItems(
                                        index + 1,
                                        jabatanC.jabatanM?.data[index]
                                            .tanggalPengesahan
                                            .fullDateAll()
                                            .toString(),
                                        jabatanC
                                            .jabatanM?.data[index].keterangan,
                                        jabatanC.jabatanM?.data[index].lama,
                                        jabatanC.jabatanM?.data[index].baru,
                                        jabatanC
                                            .jabatanM?.data[index].masaKerja,
                                        jabatanC.jabatanM?.data[index].buktiSk,
                                      ),
                                    ),
                                  ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding inputData(title, value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: customTextStyle(
              FontWeight.w600,
              12,
              cGrey_900,
            ),
          ),
          spaceHeight(3),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: cGrey_300,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_400, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(value),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchKaryawan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isShow = !isShow;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Karyawan",
                style: customTextStyle(
                  FontWeight.w600,
                  12,
                  cGrey_900,
                ),
              ),
              Icon(
                isShow ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 30,
              )
            ],
          ),
        ),
        spaceHeight(4),
        InkWell(
          onTap: () {
            Get.toNamed(
              RouteNames.searchKaryawan,
              arguments: RouteNames.jabatan,
            );
          },
          child: Container(
            width: Get.width,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_400, width: 1),
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

  Widget cardItems(
    int no,
    tglMulai,
    ket,
    jabatanLama,
    jabatanBaru,
    lamaMenjabat,
    buktiSk,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            RouteNames.detailKaryawan,
            arguments: Get.arguments[0]['nip'],
          );
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Mulai",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              tglMulai,
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
                      flex: 2,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Keterangan",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              ket.toString(),
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
                              "Jabatan Lama",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              lamaMenjabat.toString(),
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
                              "Jabatan Baru",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              jabatanBaru.toString(),
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
                              "Lama Menjabat",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              lamaMenjabat.toString(),
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
                              "Bukti SK",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              buktiSk.toString(),
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
