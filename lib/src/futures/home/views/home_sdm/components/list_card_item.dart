import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

Future<dynamic> showModalButton(BuildContext context, String name) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: 300,
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
              // selectKaryawan(list),
              spaceHeight(15),
            ],
          ),
        ),
      );
    },
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
          print("object " + index.toString());
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
