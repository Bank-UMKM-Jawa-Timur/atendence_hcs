import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget listRincianData(
  // String title,
  // String img,
  // String total,
  // String date,
  List listRician,
) {
  return ListView.builder(
    itemCount: listRician.length,
    shrinkWrap: true,
    primary: false,
    padding: const EdgeInsets.all(0),
    physics: const AlwaysScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            // border: listRician[index]['title'] == "Karyawan Pensiun"
            //     ? const Border()
            //     : const Border(
            //         bottom: BorderSide(color: cGrey_300, width: 1),
            //       ),
            color: cWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: cGrey_300,
                blurRadius: 2,
                offset: Offset(0, 2), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   width: 1,
                        //   color: cGrey_400,
                        // ),
                        color: listRician[index]['color'],
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
                        // spaceHeight(4),
                        // Text(
                        //   "Perubahan Terakhir",
                        //   style: customTextStyle(
                        //     FontWeight.w500,
                        //     11,
                        //     cGrey_700,
                        //   ),
                        // ),
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
                        FontWeight.w800,
                        17,
                        cPrimary,
                      ),
                    ),
                    // spaceHeight(4),
                    // Text(
                    //   listRician[index]['date'],
                    //   style: customTextStyle(
                    //     FontWeight.w500,
                    //     11,
                    //     cGrey_700,
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget shimmerListRincianData() {
  return Column(
    children: [
      Shimmer.fromColors(
        baseColor: cGrey_200,
        highlightColor: cPrimary_300,
        child: Container(
          width: Get.width,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      spaceHeight(5),
      Shimmer.fromColors(
        baseColor: cGrey_200,
        highlightColor: cPrimary_300,
        child: Container(
          width: Get.width,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      spaceHeight(5),
      Shimmer.fromColors(
        baseColor: cGrey_200,
        highlightColor: cPrimary_300,
        child: Container(
          width: Get.width,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      spaceHeight(5),
      Shimmer.fromColors(
        baseColor: cGrey_200,
        highlightColor: cPrimary_300,
        child: Container(
          width: Get.width,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}
