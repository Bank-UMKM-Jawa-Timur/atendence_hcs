import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/widgets/menu_laporan.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/variable/list_menu.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanMenu extends StatefulWidget {
  const LaporanMenu({super.key});

  @override
  State<LaporanMenu> createState() => _LaporanMenuState();
}

class _LaporanMenuState extends State<LaporanMenu> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarPrimaryCustom("Laporan", Colors.white, false, cPrimary),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Menu",
              style: textBoldDarkLarge,
            ),
            spaceHeight(10),
            ListView.builder(
              itemCount: ListMenuItems.menuLaporanList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: index == 0
                      ? Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: cGrey_500,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          child: AnimatedSize(
                            curve: Curves.linear,
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    splashColor: Colors.white,
                                    onTap: () {
                                      setState(() {
                                        if (index == 0) {
                                          active = !active;
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              ListMenuItems
                                                      .menuLaporanList[index]
                                                  ['icon'],
                                              size: 20,
                                              color: cPrimary,
                                            ),
                                            spaceWidth(10),
                                            Text(
                                              ListMenuItems
                                                      .menuLaporanList[index]
                                                  ['name'],
                                              style: customTextStyle(
                                                  FontWeight.w400,
                                                  15,
                                                  Colors.black),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          active
                                              ? Icons.arrow_drop_up_sharp
                                              : Icons.arrow_drop_down_sharp,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                  index == 0
                                      ? active
                                          ? MenuLaporan.subMenu()
                                          : Container()
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Get.back();
                            Get.toNamed(
                              ListMenuItems.menuLaporanList[index]['route'],
                              // arguments: [
                              //   {
                              //     'nip': '',
                              //   },
                              //   {
                              //     'nama': 'Cari Karyawan',
                              //   },
                              // ],
                            );
                          },
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: cGrey_500,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 15,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    ListMenuItems.menuLaporanList[index]
                                        ['icon'],
                                    size: 20,
                                    color: cPrimary,
                                  ),
                                  spaceWidth(10),
                                  Text(
                                    ListMenuItems.menuLaporanList[index]
                                        ['name'],
                                    style: customTextStyle(
                                        FontWeight.w400, 15, Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
