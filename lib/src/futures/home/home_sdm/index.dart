import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSdm extends StatelessWidget {
  HomeSdm({super.key});

  List listIcon = [
    {
      "name": "Manajemen",
      "icon": "assets/icon/manajemen.png",
    },
    {
      "name": "Penghasilan",
      "icon": "assets/icon/penghasilan.png",
    },
    {
      "name": "Histori",
      "icon": "assets/icon/histori.png",
    },
    {
      "name": "Laporan",
      "icon": "assets/icon/laporan.png",
    },
  ];

  List listRician = [
    {
      'title': 'Karyawan',
      'icon': 'assets/icon/karyawan.png',
      'total': '1830',
      'date': 'Sabtu, 12 Feb 2024',
    },
    {
      'title': 'Karyawan Masuk',
      'icon': 'assets/icon/karyawan_masuk.png',
      'total': '30',
      'date': 'Sabtu, 12 Feb 2024',
    },
    {
      'title': 'Karyawan Keluar',
      'icon': 'assets/icon/karyawan_keluar.png',
      'total': '10',
      'date': 'Sabtu, 12 Feb 2024',
    },
    {
      'title': 'Karyawan Pensiun',
      'icon': 'assets/icon/karyawan_pensiun.png',
      'total': '2',
      'date': 'Sabtu, 12 Feb 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: heightStatusBar,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(25),
            headerHomeSdm(),
            spaceHeight(25),
            cardPayment(),
            spaceHeight(25),
            listCardItems(),
            spaceHeight(25),
            Container(
              width: Get.width,
              height: 1,
              color: cGrey_400,
            ),
            spaceHeight(20),
            Text(
              "Rincian Data",
              style: customTextStyle(FontWeight.w600, 16, Colors.black),
            ),
            spaceHeight(20),
            Expanded(
              child: ListView.builder(
                itemCount: listRician.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.width,
                    height: 80,
                    decoration: BoxDecoration(
                      border: listRician[index]['title'] == "Karyawan Pensiun"
                          ? const Border()
                          : const Border(
                              bottom: BorderSide(color: cGrey_300, width: 1),
                            ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: cGrey_400,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(listRician[index]['icon']),
                                ),
                              ),
                            ),
                            spaceWidth(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  listRician[index]['title'],
                                  style: customTextStyle(
                                    FontWeight.w600,
                                    15,
                                    Colors.black,
                                  ),
                                ),
                                spaceHeight(4),
                                Text(
                                  "Perubahan Terakhir",
                                  style: customTextStyle(
                                    FontWeight.w500,
                                    11,
                                    cGrey_700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              listRician[index]['total'],
                              style: customTextStyle(
                                FontWeight.w600,
                                15,
                                Colors.black,
                              ),
                            ),
                            spaceHeight(4),
                            Text(
                              listRician[index]['date'],
                              style: customTextStyle(
                                FontWeight.w500,
                                11,
                                cGrey_700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  GridView listCardItems() {
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
        return Column(
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
        );
      },
    );
  }

  Widget cardPayment() {
    return Container(
      width: Get.width,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(17),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/card.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Perkiraan Gaji Bulan Ini",
                  style: customTextStyle(
                    FontWeight.w700,
                    14,
                    Colors.white,
                  ),
                ),
                const Icon(
                  CommunityMaterialIcons.wallet_outline,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: customTextStyle(
                    FontWeight.w700,
                    13,
                    cPrimary_300,
                  ),
                ),
                Text(
                  "Rp 450,000,000",
                  style: customTextStyle(
                    FontWeight.w800,
                    24,
                    Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget headerHomeSdm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/icon/male.jpg'),
                ),
              ),
            ),
            spaceWidth(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dasha Taran",
                  style: customTextStyle(
                    FontWeight.w700,
                    17,
                    Colors.black,
                  ),
                ),
                spaceHeight(2),
                Text(
                  "Service Advisor",
                  style: customTextStyle(
                    FontWeight.w500,
                    14,
                    cGrey_700,
                  ),
                ),
              ],
            )
          ],
        ),
        const Icon(
          Icons.notifications_none,
          size: 30,
          color: cPrimary,
        )
      ],
    );
  }
}
