import 'package:atendence_hcs/routes/route_name.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List managementList = [
  {
    'icon': Icons.line_style_sharp,
    'name': "Karyawan",
    'route': Get.toNamed(RouteNames.karyawanList),
  },
  {
    'icon': Icons.line_style_sharp,
    'name': "Karyawan",
    'route': Get.toNamed(RouteNames.karyawanList),
  },
  {
    'icon': Icons.line_style_sharp,
    'name': "Karyawan",
    'route': Get.toNamed(RouteNames.karyawanList),
  },
  {
    'icon': Icons.line_style_sharp,
    'name': "Karyawan",
    'route': Get.toNamed(RouteNames.karyawanList),
  },
  {
    'icon': Icons.line_style_sharp,
    'name': "Karyawan",
    'route': Get.toNamed(RouteNames.karyawanList),
  },
  {
    'icon': Icons.line_style_sharp,
    'name': "Karyawan",
    'route': Get.toNamed(RouteNames.karyawanList),
  },
];

bool subMenuKarir = false;

Future<dynamic> showModalButton(BuildContext context, String name) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
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
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(
                          RouteNames.karyawanList,
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
                              const Icon(
                                Icons.line_style_sharp,
                                size: 17,
                              ),
                              spaceWidth(10),
                              const Text("Karyawan"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    spaceHeight(10),
                    Container(
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
                                    subMenuKarir = !subMenuKarir;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.line_style_sharp,
                                          size: 17,
                                        ),
                                        spaceWidth(10),
                                        const Text("Pengkinian Data"),
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
                              subMenuKarir
                                  ? subMenuPergerakanKarir()
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
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

Padding subMenuPergerakanKarir() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 5,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: cPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            spaceWidth(10),
            const Text("Mutasi"),
          ],
        ),
      ],
    ),
  );
}

GridView listCardItems(List listIcon) {
  return GridView.builder(
    itemCount: listIcon.length,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: const EdgeInsets.only(top: 0),
    primary: false,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      childAspectRatio: 0.9,
    ),
    itemBuilder: (context, index) {
      return InkWell(
        splashColor: cGrey_100,
        highlightColor: Colors.white,
        onTap: () {
          showModalButton(context, "Manajemen Karyawan");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                border: Border.all(
                  color: cGrey_400,
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Image(
                    image: AssetImage(listIcon[index]['icon']),
                  ),
                ),
              ),
            ),
            spaceHeight(5),
            Text(
              listIcon[index]['name'],
              style: customTextStyle(FontWeight.w600, 11, cGrey_700),
            ),
          ],
        ),
      );
    },
  );
}
