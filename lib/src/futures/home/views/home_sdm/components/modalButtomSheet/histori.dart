import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/variable/list_menu.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool active = false;

class ModalButtonHistori {
  static Future<dynamic> showModalButton(BuildContext context, String name) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceHeight(5),
                      Center(
                        child: Container(
                          width: 70,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: cGrey_500,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      spaceHeight(15),
                      Text(
                        name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      spaceHeight(15),
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
                                        ListMenuItems.menuHistoriList[index]
                                            ['icon'],
                                        size: 17,
                                      ),
                                      spaceWidth(10),
                                      Text(
                                        ListMenuItems.menuHistoriList[index]
                                            ['name'],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // spaceHeight(10),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
