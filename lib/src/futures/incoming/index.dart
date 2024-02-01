import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

commingSoon(String title) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Image(
              image: AssetImage('assets/images/comming_soon.png'),
            ),
          ),
          spaceHeight(10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: cPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
