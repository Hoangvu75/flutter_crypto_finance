import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizeWidth(context) * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          TransactionMethodWidget(
            iconData: Icons.person_2_outlined,
            title: "Facepay settings",
          ),
          TransactionMethodWidget(
            iconData: Icons.security_update_good,
            title: "Soft OTP settings",
          ),
          TransactionMethodWidget(
            iconData: Icons.password,
            title: "Soft OTP PIN code",
          ),
        ],
      ),
    );
  }
}

class TransactionMethodWidget extends StatelessWidget {
  const TransactionMethodWidget({
    super.key,
    required this.iconData,
    required this.title,
  });

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTap(
          onPressed: () {},
          child: Container(
            width: sizeWidth(context) * 0.2,
            height: sizeWidth(context) * 0.2,
            padding: EdgeInsets.all(sizeWidth(context) * 0.03),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04),
                border: Border.all(color: primaryColor),
              ),
              child: Center(
                child: Icon(
                  iconData,
                  size: sizeWidth(context) * 0.075,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: sizeHeight(context) * 0.015,
        ),
        SizedBox(
          width: sizeWidth(context) * 0.25,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontFamily: fontsSVNGilroyRegular,
              color: normalTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
