import 'package:atendence_hcs/src/futures/SDM/penghasilan/views/components/row_items.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RincianPenghasilan extends StatefulWidget {
  const RincianPenghasilan({super.key});

  @override
  State<RincianPenghasilan> createState() => _RincianPenghasilanState();
}

class _RincianPenghasilanState extends State<RincianPenghasilan> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: appBarPrimary("Rincian Penghasilan"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cGrey_400, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: cardData(
                0,
                "nip",
                "nama",
                "gajiPokok",
                "tKeluarga",
                "tTeleponListrik",
                "tJabatan",
                "tKhusus",
                "tPerumahan",
                "tPelaksana",
                "tKemahalan",
                "tKesejahteraan",
                "tTeller",
                "penyesuaian",
                "total",
                "pph21",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container cardData(
    index,
    nip,
    nama,
    gajiPokok,
    tKeluarga,
    tTeleponListrikDanAir,
    tJabatan,
    tKhusus,
    tPerumahan,
    tPelaksana,
    tKemahalan,
    tKesejahteraan,
    tTeller,
    penyesuaian,
    total,
    pph21,
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
                isShow = !isShow;
                // dataMasaPensiunC.isActiveList![index] =
                //     !dataMasaPensiunC.isActiveList![index];
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
                // dataMasaPensiunC.isActiveList![index]
                isShow
                    ? Column(
                        children: [
                          spaceHeight(10),
                          row1(gajiPokok, tKeluarga, tTeleponListrikDanAir),
                          row2(tJabatan, tKhusus, tPerumahan),
                          row3(tPelaksana, tKemahalan, tKesejahteraan),
                          row4(tTeller, penyesuaian, total),
                          row5(total),
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
}
