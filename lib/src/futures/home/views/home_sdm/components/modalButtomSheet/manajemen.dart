import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/widgets/menu_manajemen.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/variable/list_menu.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool subMenuKarir = false;
bool subMenuReward = false;

class ModalButtonManajements {
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
              height: 570,
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
                        itemCount: ListMenuItems.menuManagementList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: index == 3 || index == 5
                                ? dropDownMenuPergerakanKarir(setState, index)
                                : InkWell(
                                    onTap: () {
                                      Get.back();
                                      Get.toNamed(
                                        ListMenuItems.menuManagementList[index]
                                            ['route'],
                                        arguments: index == 0
                                            ? [
                                                {
                                                  'nip': '',
                                                },
                                                {
                                                  'nama': 'Cari Karyawan',
                                                },
                                              ]
                                            : ListMenuItems
                                                    .menuManagementList[index]
                                                ['arguments'],
                                      );
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
                                          vertical: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              ListMenuItems
                                                      .menuManagementList[index]
                                                  ['icon'],
                                              size: 17,
                                            ),
                                            spaceWidth(10),
                                            Text(
                                              ListMenuItems
                                                      .menuManagementList[index]
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

  static Container dropDownMenuPergerakanKarir(
      StateSetter setState, int index) {
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
            vertical: 5,
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
                          size: 17,
                        ),
                        spaceWidth(10),
                        Text(
                          ListMenuItems.menuManagementList[index]['name'],
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
