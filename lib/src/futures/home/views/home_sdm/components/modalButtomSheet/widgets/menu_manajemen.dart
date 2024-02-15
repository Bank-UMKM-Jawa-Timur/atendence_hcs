import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

List subMenuPK = [
  {'name': "Mutasi"},
  {'name': "Demosi"},
  {'name': "Promosi"},
  {'name': "Penonaktifan"},
];

class MenuManajements {
  static Padding subMenuPergerakanKarir() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      child: ListView.builder(
        itemCount: subMenuPK.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
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
                  Text(subMenuPK[index]['name']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static Padding subMenuRewardAndPunishment() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
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
            const Text("Surat Peringatan"),
          ],
        ),
      ),
    );
  }
}
