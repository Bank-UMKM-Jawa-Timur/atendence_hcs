import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

Widget profileImage(String jenisKelamin) {
  return SizedBox(
    width: 120,
    height: 120,
    child: Center(
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              image: DecorationImage(
                image: AssetImage(
                  jenisKelamin != "Laki-laki"
                      ? 'assets/icon/female.jpg'
                      : 'assets/icon/male.jpg',
                ),
              ),
            ),
          ),
          Positioned(
            left: 70,
            top: 70,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: cPrimary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    CommunityMaterialIcons.camera_outline,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
