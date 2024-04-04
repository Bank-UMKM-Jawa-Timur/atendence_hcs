import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/controllers/promosi_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromosiPage extends StatefulWidget {
  const PromosiPage({super.key});

  @override
  State<PromosiPage> createState() => _PromosiPageState();
}

class _PromosiPageState extends State<PromosiPage> {
  PromosiController promosiC = Get.find<PromosiController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  var page = 1;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    if (nip != '') {
      promosiC.getListPromosi(nip, page);
    }
    promosiC.getListPromosi(nip, page);
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
    promosiC.getListPromosi(nip, page);
    setState(() {});
  }

  clearData() {
    page = 1;
    promosiC.promosiM?.data.clear();
    setState(() {});
    promosiC.getListPromosi(nip, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: AppBar(
        title: const Text(
          "Promosi",
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
                    arguments: RouteNames.promosi,
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
                ? promosiC.isLoading.value
                    ? loadingPage()
                    : promosiC.isEmptyData.value
                        ? emtyPage("Mutasi $nama Masih Kosong!")
                        : cardDataItems()
                : cardDataItems(),
          )
        ],
      ),
    );
  }

  Expanded cardDataItems() {
    return Expanded(
      child: RefreshIndicator(
        backgroundColor: cPrimary,
        color: Colors.white,
        onRefresh: () => clearData(),
        child: ListView.builder(
          controller: controller,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: promosiC.promosiM?.data.length ?? 0,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < promosiC.promosiM!.data.length) {
              return cardItems(
                index + 1,
                promosiC.promosiM?.data[index].nip,
                promosiC.promosiM?.data[index].namaKaryawan,
                promosiC.promosiM?.data[index].tanggalPengesahan,
                promosiC.promosiM?.data[index].buktiSk,
                promosiC.promosiM?.data[index].jabatanLama,
                promosiC.promosiM?.data[index].jabatanBaru,
                promosiC.promosiM?.data[index].kantorLama,
                promosiC.promosiM?.data[index].kantorBaru,
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: !promosiC.isEmptyData.value
                      ? (promosiC.promosiM!.data.length / page) >= 10
                          ? Column(
                              children: [
                                spaceHeight(100),
                                const CircularProgressIndicator(),
                                spaceHeight(30),
                              ],
                            )
                          : Container()
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
    tglPromosi,
    buktiSK,
    jabatanLama,
    jabatanBaru,
    kantorLama,
    kantorBaru,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
        onTap: () {},
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
                                nama,
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
                              "Tanggal Promosi",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              tglPromosi,
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
                              buktiSK,
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
                              "Jabatan Lama",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              jabatanLama,
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
                              jabatanBaru,
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
                              "Kantor Lama",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              kantorLama,
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
                              "Kantor Baru",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              kantorBaru,
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
