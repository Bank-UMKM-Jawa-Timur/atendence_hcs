import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/histori.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/laporan.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/manajemen.dart';
import 'package:atendence_hcs/src/futures/home/views/home_sdm/components/modalButtomSheet/penghasilan.dart';
import 'package:atendence_hcs/utils/components/all_widget.dart';
import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

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
          if (index == 0) {
            ModalButtonManajements.showModalButton(
                context, "Manajemen Karyawan");
          } else if (index == 1) {
            ModalButtonPenghasilan.showModalButton(context, 'Penghasilan');
          } else if (index == 2) {
            ModalButtonHistori.showModalButton(context, 'Histori');
          } else if (index == 3) {
            ModalButtonLaporan.showModalButton(context, 'Laporan');
          }
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
