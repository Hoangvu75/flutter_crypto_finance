import 'package:flutter/material.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizeWidth(context) * 0.04,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04),
        ),
        child: Column(
          children: [
            const SecuritySettingsWidget(
              iconData: Icons.lock_outline,
              title: "Change password",
            ),
            Divider(
              color: Colors.white,
              height: 0,
              thickness: sizeHeight(context) * 0.001,
            ),
            const SecuritySettingsWidget(
              iconData: Icons.web_outlined,
              title: "Ipay web login management",
            ),
            Divider(
              color: Colors.white,
              height: 0,
              thickness: sizeHeight(context) * 0.001,
            ),
            const SecuritySettingsWidget(
              iconData: Icons.qr_code_scanner,
              title: "Auto QR Pay login",
            ),
            Divider(
              color: Colors.white,
              height: 0,
              thickness: sizeHeight(context) * 0.001,
            ),
            const SecuritySettingsWidget(
              iconData: Icons.fingerprint,
              title: "Fingerprint login",
            ),
          ],
        ),
      ),
    );
  }
}

class SecuritySettingsWidget extends StatelessWidget {
  const SecuritySettingsWidget({
    super.key,
    required this.iconData,
    required this.title,
  });

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sizeWidth(context) * 0.04),
      child: Row(
        children: [
          Icon(
            iconData,
            color: primaryColor,
          ),
          SizedBox(
            width: sizeWidth(context) * 0.04,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontFamily: fontsSVNGilroyRegular,
              color: normalTextColor,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
