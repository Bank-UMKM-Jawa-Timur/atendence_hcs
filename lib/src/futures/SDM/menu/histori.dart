import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/variable/list_menu.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/my_appbar.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoriMenu extends StatefulWidget {
  const HistoriMenu({super.key});

  @override
  State<HistoriMenu> createState() => _HistoriMenuState();
}

class _HistoriMenuState extends State<HistoriMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary_200,
      appBar: appBarPrimaryCustom("Histori", Colors.white, false, cPrimary),
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
              itemCount: ListMenuItems.menuHistoriList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      Get.toNamed(
                        ListMenuItems.menuHistoriList[index]['route'],
                        arguments: [
                          {
                            'nip': '',
                          },
                          {
                            'nama': 'Cari Karyawan',
                          },
                        ],
                      );
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
                              ListMenuItems.menuHistoriList[index]['icon'],
                              size: 20,
                              color: cPrimary,
                            ),
                            spaceWidth(10),
                            Text(
                              ListMenuItems.menuHistoriList[index]['name'],
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
