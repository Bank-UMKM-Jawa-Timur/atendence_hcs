import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

Widget emtyPage(var title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/empty.png'),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: cGrey_700,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

Widget searchEmptyPage(var title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/search_empty.png'),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: cGrey_700,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
