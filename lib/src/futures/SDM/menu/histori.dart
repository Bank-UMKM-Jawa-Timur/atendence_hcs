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
      backgroundColor: Colors.white,
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
                  padding: const EdgeInsets.symmetric(vertical: 5),
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
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              ListMenuItems.menuHistoriList[index]['icon'],
                              size: 17,
                            ),
                            spaceWidth(10),
                            Text(
                              ListMenuItems.menuHistoriList[index]['name'],
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
