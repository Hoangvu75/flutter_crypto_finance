import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: sizeWidth(context) * 0.04,
          vertical: sizeHeight(context) * 0.02,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: sizeWidth(context) * 0.04,
          vertical: sizeHeight(context) * 0.02,
        ),
        decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.75),
            borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04)
        ),
        child: Center(
          child: Text(
            "Log out",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontFamily: fontsSVNGilroySemiBold,
              color: normalTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
