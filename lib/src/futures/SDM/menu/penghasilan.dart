import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/widgets/menu_penghasilan.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/variable/list_menu.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenghasilanMenu extends StatefulWidget {
  const PenghasilanMenu({super.key});

  @override
  State<PenghasilanMenu> createState() => _PenghasilanMenuState();
}

class _PenghasilanMenuState extends State<PenghasilanMenu> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: appBarPrimaryCustom("Penghasilan", Colors.white, false, cPrimary),
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
              itemCount: ListMenuItems.menuPenghasilanList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: index == 1
                      ? menuDropdown(index)
                      : InkWell(
                          onTap: () {
                            Get.offNamed(RouteNames.penghasilan);
                            // Get.back();
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
                            decoration: const BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: cGrey_300,
                                  blurRadius: 2,
                                  offset: Offset(0, 2), // Shadow position
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 15,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    ListMenuItems.menuPenghasilanList[index]
                                        ['icon'],
                                    size: 20,
                                    color: cPrimary,
                                  ),
                                  spaceWidth(10),
                                  Text(
                                    ListMenuItems.menuPenghasilanList[index]
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

  Container menuDropdown(int index) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: cGrey_300,
            blurRadius: 2,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
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
                    if (index == 1) {
                      active = !active;
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          ListMenuItems.menuPenghasilanList[index]['icon'],
                          size: 20,
                          color: cPrimary,
                        ),
                        spaceWidth(10),
                        Text(
                          ListMenuItems.menuPenghasilanList[index]['name'],
                          style: customTextStyle(
                              FontWeight.w400, 15, Colors.black),
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
              index == 1
                  ? active
                      ? MenuPenghasilan.subMenu()
                      : Container()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
