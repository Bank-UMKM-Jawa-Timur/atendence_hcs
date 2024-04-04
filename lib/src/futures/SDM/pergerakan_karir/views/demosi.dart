import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/pergerakan_karir/controllers/demosi_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemosiPage extends StatefulWidget {
  const DemosiPage({super.key});

  @override
  State<DemosiPage> createState() => _DemosiPageState();
}

class _DemosiPageState extends State<DemosiPage> {
  DemosiController demosiC = Get.find<DemosiController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];
  var page = 1;
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    if (nip != "") {
      demosiC.getListDemosi(nip, page);
    }
    demosiC.getListDemosi(nip, page);
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
    demosiC.getListDemosi(nip, page);
    setState(() {});
  }

  clearData() {
    page = 1;
    demosiC.demosiM?.data.clear();
    setState(() {});
    demosiC.getListDemosi(nip, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: AppBar(
        title: const Text(
          "Demosi",
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
                    arguments: RouteNames.demosi,
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
          spaceHeight(20),
          Obx(
            () => page == 1
                ? demosiC.isLoading.value
                    ? loadingPage()
                    : demosiC.isEmptyData.value
                        ? emtyPage("Mutasi $nama Masih Kosong!")
                        : cardDateItems()
                : cardDateItems(),
          )
        ],
      ),
    );
  }

  Expanded cardDateItems() {
    return Expanded(
      child: RefreshIndicator(
        backgroundColor: cPrimary,
        color: Colors.white,
        onRefresh: () => clearData(),
        child: ListView.builder(
          controller: controller,
          itemCount: demosiC.demosiM!.data.length,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < demosiC.demosiM!.data.length) {
              return cardItems(
                index + 1,
                demosiC.demosiM?.data[index].nip,
                demosiC.demosiM?.data[index].namaKaryawan,
                demosiC.demosiM?.data[index].tanggalPengesahan,
                demosiC.demosiM?.data[index].buktiSk,
                demosiC.demosiM?.data[index].jabatanLama,
                demosiC.demosiM?.data[index].jabatanBaru,
                demosiC.demosiM?.data[index].kantorLama,
                demosiC.demosiM?.data[index].kantorBaru,
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: !demosiC.isEmptyData.value
                      ? (demosiC.demosiM!.data.length / page) >= 10
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
    tglMutasi,
    buktiSK,
    jabatanLama,
    jabatanBaru,
    kantorLama,
    kantorBaru,
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
                              "Tanggal Demosi",
                              style: customTextStyle(
                                FontWeight.w600,
                                12,
                                cGrey_700,
                              ),
                            ),
                            Text(
                              tglMutasi,
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
