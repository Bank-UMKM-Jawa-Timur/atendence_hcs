import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_format_currency.dart';
import 'package:atendence_hcs/utils/components/my_shoten_last_name.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cardItemsPayroll(
  BuildContext context,
  no,
  nama,
  nip,
  gaji,
  norek,
  jpBpjsTK1,
  dpp5,
  kreditKoperasi,
  luaranKoperasi,
  kreditPegawai,
  iuranIk,
  totalPotongan,
  totalDiterima,
) {
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
                          width: 150,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Gaji",
                      style: customTextStyle(
                        FontWeight.w500,
                        12,
                        cGrey_700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      gaji,
                      style: customTextStyle(
                        FontWeight.w700,
                        14,
                        cPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
            spaceHeight(10),
            Container(
              width: Get.width,
              height: 1,
              color: cGrey_400,
            ),
            spaceHeight(10),
            InkWell(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      'Potongan - ${shortenLastName(nama)}',
                      style: customTextStyle(FontWeight.w600, 14, Colors.black),
                    ),
                    content: SizedBox(
                      width: Get.width,
                      height: 165,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'JP BPJS TK 1%',
                                        style: customTextStyle(
                                            FontWeight.w400, 12, Colors.black),
                                      ),
                                      Text(
                                        jpBpjsTK1,
                                        style: customTextStyle(
                                            FontWeight.w700, 13, Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                spaceWidth(5),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DPP 5%',
                                        style: customTextStyle(
                                            FontWeight.w400, 12, Colors.black),
                                      ),
                                      Text(
                                        dpp5,
                                        style: customTextStyle(
                                            FontWeight.w700, 13, Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            spaceHeight(15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kredit Koperasi',
                                        style: customTextStyle(
                                            FontWeight.w400, 12, Colors.black),
                                      ),
                                      Text(
                                        kreditKoperasi,
                                        style: customTextStyle(
                                            FontWeight.w700, 13, Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                spaceWidth(5),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Luaran Koperasi',
                                        style: customTextStyle(
                                            FontWeight.w400, 12, Colors.black),
                                      ),
                                      Text(
                                        luaranKoperasi,
                                        style: customTextStyle(
                                            FontWeight.w700, 13, Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            spaceHeight(15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kredit Pegawai',
                                        style: customTextStyle(
                                            FontWeight.w400, 12, Colors.black),
                                      ),
                                      Text(
                                        kreditPegawai,
                                        style: customTextStyle(
                                            FontWeight.w700, 13, Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                spaceWidth(5),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Iuran IK',
                                        style: customTextStyle(
                                            FontWeight.w400, 12, Colors.black),
                                      ),
                                      Text(
                                        iuranIk,
                                        style: customTextStyle(
                                            FontWeight.w700, 13, Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      InkWell(
                        splashColor: cPrimary,
                        onTap: () => Get.back(),
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: cPrimary, width: 1.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "OK",
                                style: TextStyle(color: cPrimary),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: cPrimary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Center(
                    child: Text(
                      "Detail Jamsostek",
                      style: customTextStyle(FontWeight.w500, 11, Colors.white),
                    ),
                  ),
                ),
              ),
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
                          "No Rek",
                          style: customTextStyle(
                            FontWeight.w600,
                            12,
                            cGrey_700,
                          ),
                        ),
                        Text(
                          norek,
                          style: customTextStyle(
                            FontWeight.w800,
                            13,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spaceWidth(5),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Potongan",
                          style: customTextStyle(
                            FontWeight.w600,
                            12,
                            cGrey_700,
                          ),
                        ),
                        Text(
                          totalPotongan,
                          style: customTextStyle(
                            FontWeight.w800,
                            13,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spaceWidth(5),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Diterima",
                          style: customTextStyle(
                            FontWeight.w600,
                            12,
                            cGrey_700,
                          ),
                        ),
                        Text(
                          totalDiterima,
                          style: customTextStyle(
                            FontWeight.w800,
                            13,
                            cGrey_600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
