import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/widgets/menu_manajemen.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/variable/list_menu.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManajementMenu extends StatefulWidget {
  const ManajementMenu({super.key});

  @override
  State<ManajementMenu> createState() => _ManajementMenuState();
}

class _ManajementMenuState extends State<ManajementMenu> {
  bool subMenuKarir = false;
  bool subMenuReward = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarPrimaryCustom(
          "Manajemen Karyawan", Colors.white, false, cPrimary),
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
              itemCount: ListMenuItems.menuManagementList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: index == 3 || index == 5
                      ? dropdownMenu(index)
                      : InkWell(
                          onTap: () {
                            Get.back();
                            if (index == 0) {
                              Get.toNamed(
                                ListMenuItems.menuManagementList[index]
                                    ['route'],
                                arguments: [
                                  {'nip': ''},
                                  {'nama': 'Cari Karyawan'},
                                ],
                              );
                            } else if (index == 2) {
                              Get.toNamed(
                                ListMenuItems.menuManagementList[index]
                                    ['route'],
                                arguments: [
                                  {'nip': ''},
                                  {'nama': 'Cari Karyawan'},
                                ],
                              );
                            } else if (index == 3) {
                              Get.toNamed(
                                ListMenuItems.menuManagementList[index]
                                    ['route'],
                                arguments: ListMenuItems
                                    .menuManagementList[index]['arguments'],
                              );
                            } else if (index == 4) {
                              Get.toNamed(
                                ListMenuItems.menuManagementList[index]
                                    ['route'],
                                arguments: [
                                  {'nip': ''},
                                  {'nama': 'Cari Karyawan'},
                                ],
                              );
                            } else {
                              Get.toNamed(
                                ListMenuItems.menuManagementList[index]
                                    ['route'],
                                arguments: ListMenuItems
                                    .menuManagementList[index]['arguments'],
                              );
                            }
                            // Get.toNamed(
                            //   RouteNames.karyawanList,
                            //   arguments: [
                            //     {
                            //       'nip': '',
                            //     },
                            //     {
                            //       'nama': 'Cari Karyawan',
                            //     },
                            //   ],
                            // );
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
                                    ListMenuItems.menuManagementList[index]
                                        ['icon'],
                                    size: 20,
                                    color: cPrimary,
                                  ),
                                  spaceWidth(10),
                                  Text(
                                    ListMenuItems.menuManagementList[index]
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

  Container dropdownMenu(int index) {
    return Container(
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
                    if (index == 3) {
                      if (subMenuReward == true) {
                        subMenuReward = false;
                      }
                      subMenuKarir = !subMenuKarir;
                    } else if (index == 5) {
                      if (subMenuKarir == true) {
                        subMenuKarir = false;
                      }
                      subMenuReward = !subMenuReward;
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          ListMenuItems.menuManagementList[index]['icon'],
                          size: 20,
                          color: cPrimary,
                        ),
                        spaceWidth(10),
                        Text(
                          ListMenuItems.menuManagementList[index]['name'],
                          style: customTextStyle(
                              FontWeight.w400, 15, Colors.black),
                        ),
                      ],
                    ),
                    Icon(
                      subMenuKarir
                          ? Icons.arrow_drop_up_sharp
                          : Icons.arrow_drop_down_sharp,
                      size: 30,
                    )
                  ],
                ),
              ),
              index == 3
                  ? subMenuKarir
                      ? MenuManajements.subMenuPergerakanKarir()
                      : Container()
                  : Container(),
              index == 5
                  ? subMenuReward
                      ? MenuManajements.subMenuRewardAndPunishment()
                      : Container()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
