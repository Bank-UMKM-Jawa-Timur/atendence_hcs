import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:flutter/material.dart';

const textBoldLightSmall = TextStyle(
  fontSize: 8,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const textBoldLightMedium = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const textBoldLightLarge = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const textBoldLightSecondLarge = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

// Bold Dark
const textBoldDarkSmall = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const textBoldDarkMedium = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const textBoldDarkLarge = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const textBoldDarkVeryLarge = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

// Bold Grey
const textBoldGreySmall = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w700,
  color: cGrey_700,
);
const textBoldGreyMedium = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: cGrey_700,
);
const textBoldGreyLarge = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: cGrey_700,
);
const textBoldGreyVeryLarge = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: cGrey_700,
);

// Bold Grey
const textGreySmall = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w500,
  color: cGrey_700,
);
const textGreyMedium = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: cGrey_700,
);
const textGreyLarge = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: cGrey_700,
);
const textGreyVeryLarge = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: cGrey_700,
);

customTextStyle(FontWeight weight, double size, Color color) {
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    color: color,
  );
}
