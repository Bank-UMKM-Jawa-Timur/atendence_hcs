import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/SDM/components/empty_data.dart';
import 'package:atendence_hcs/src/futures/SDM/reward_and_punishment/controllers/surat_peringatan_controller.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/empty_page.dart';
import 'package:atendence_hcs/utils/components/my_loading.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:atendence_hcs/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuratPeringatan extends StatefulWidget {
  const SuratPeringatan({super.key});

  @override
  State<SuratPeringatan> createState() => _SuratPeringatanState();
}

class _SuratPeringatanState extends State<SuratPeringatan> {
  SuratPeringatanController spC = Get.find<SuratPeringatanController>();
  var nip = Get.arguments[0]['nip'];
  var nama = Get.arguments[1]['nama'];

  @override
  void initState() {
    super.initState();
    if (nip != "") {
      spC.getListSP(nip);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Surat Peringatan",
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
                    arguments: RouteNames.suratPeringatan,
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
                            nip == ""
                                ? nama
                                : "$nip - ${shortenLastName(nama)}",
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
          nip == ""
              ? emptyData("Surat Peringatan")
              : Obx(
                  () => spC.isLoading.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 250),
                          child: loadingPage(),
                        )
                      : spC.isEmptyData.value
                          ? emtyPage(
                              "Hasil Surat Peringatan untuk/n$nama masih kosong!")
                          : Expanded(
                              child: RefreshIndicator(
                                color: Colors.white,
                                backgroundColor: cPrimary,
                                onRefresh: () => spC.getListSP(nip),
                                child: ListView.builder(
                                  itemCount: spC.spM?.data.length ?? 0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return cardItems(
                                      index + 1,
                                      spC.spM?.data[index].noSp ?? '-',
                                      spC.spM?.data[index].tanggalSp.toString(),
                                      spC.spM?.data[index].pelanggaran ?? '-',
                                    );
                                  },
                                ),
                              ),
                            ),
                )
        ],
      ),
    );
  }

  Padding cardItems(no, noSp, tglSp, pelanggaran) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            RouteNames.detailSuratPeringatan,
            arguments: Get.arguments[0]['nip'],
          );
          // Get.snackbar(
          //   backgroundColor: cRed_700,
          //   "⚠️Warning!",
          //   "Detail Surat Peringatan dalam proses pengembangan🙏🏻",
          //   colorText: Colors.white,
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
