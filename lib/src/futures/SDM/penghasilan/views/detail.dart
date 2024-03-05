import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/penghasilan/controllers/detail_penghasilan_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_format_bulan.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPenghasilan extends StatefulWidget {
  const DetailPenghasilan({super.key});

  @override
  State<DetailPenghasilan> createState() => _DetailPenghasilanState();
}

class _DetailPenghasilanState extends State<DetailPenghasilan> {
  DetailPenghasilanController detailPenghasilanC =
      Get.find<DetailPenghasilanController>();
  final controller = ScrollController();
  int page = 1;
  int id = Get.arguments;
  @override
  void initState() {
    super.initState();
    detailPenghasilanC.getDetailPenghasilan(id, page);
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
    detailPenghasilanC.getDetailPenghasilan(id, page);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Detail Penghasilan"),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              page == 1
                  ? detailPenghasilanC.isLoading.value
                      ? loadingPage()
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
        itemCount: detailPenghasilanC.detailPenghasilanM!.data.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var data = detailPenghasilanC.detailPenghasilanM!.data;
          if (index < detailPenghasilanC.detailPenghasilanM!.data.length) {
            return cardItems(
              index,
              data[index].namaKaryawan,
              data[index].nip,
              int.parse(data[index].bulan),
              data[index].tahun,
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: detailPenghasilanC.isEmptyData.value
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

  Widget cardItems(index, nama, nip, bulan, tahun) {
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
                                "${index + 1}".toString(),
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
                                  nama,
                                  style: customTextStyle(
                                    FontWeight.w700,
                                    14,
                                    Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "$nip | ${FormatBulan().formatBulan(bulan)} - $tahun",
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteNames.rincianPenghasilan,
                              arguments: {
                                'id': Get.arguments,
                                'bulan': bulan,
                                'tahun': tahun,
                                'nip': nip,
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text(
                          "Rincian",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceWidth(5),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: cGreen_900,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteNames.payrollPenghasilan,
                              arguments: {
                                'id': Get.arguments,
                                'bulan': bulan,
                                'tahun': tahun,
                                'nip': nip,
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: cGreen_900,
                        ),
                        child: const Text(
                          "Payroll",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              spaceHeight(5)
            ],
          ),
        ),
      ),
    );
  }
}
