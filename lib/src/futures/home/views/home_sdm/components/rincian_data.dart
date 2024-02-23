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
    physics: const NeverScrollableScrollPhysics(),
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
