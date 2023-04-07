import 'package:flutter/material.dart';

Size responsiveSize = const Size(1, 1);

double sizeWidth(BuildContext context) {
  double sizeWidth = MediaQuery.of(context).size.width;
  return sizeWidth;
}

double sizeHeight(BuildContext context) {
  double sizeHeight = MediaQuery.of(context).size.height;
  return sizeHeight;
}
