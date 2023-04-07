import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class AppBarWallet extends StatelessWidget {
  const AppBarWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(sizeWidth(context) * 0.05),
          bottomRight: Radius.circular(sizeWidth(context) * 0.05),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                decreasedValueColor.withOpacity(0.5),
                primaryColor.withOpacity(1),
                increasedValueColor.withOpacity(0.5),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -sizeHeight(context) * 0.04,
                left: -sizeWidth(context) * 0.06,
                child: Container(
                  width: sizeWidth(context) * 0.5,
                  height: sizeWidth(context) * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(sizeWidth(context) * 0.5),
                  ),
                ),
              ),
              Positioned(
                bottom: -sizeHeight(context) * 0.04,
                right: sizeWidth(context) * 0.1,
                child: Container(
                  width: sizeWidth(context) * 0.8,
                  height: sizeWidth(context) * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(sizeWidth(context) * 0.5),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(sizeWidth(context) * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        ScaleTap(
                          onPressed: () {},
                          child: Stack(
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                size: sizeWidth(context) * 0.07,
                                color: Colors.white,
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  width: sizeWidth(context) * 0.035,
                                  height: sizeWidth(context) * 0.035,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04)),
                                  child: Center(
                                    child: Text(
                                      "4",
                                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                            fontFamily: fontsSVNGilroySemiBold,
                                            color: normalTextColor,
                                          ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: sizeWidth(context) * 0.04,
                        ),
                        ScaleTap(
                          onPressed: () {},
                          child: Icon(
                            Icons.info_outline,
                            size: sizeWidth(context) * 0.07,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: sizeWidth(context),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "\$ 5730",
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontFamily: fontsSVNGilroySemiBold,
                                  color: normalTextColor,
                                ),
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.01,
                          ),
                          Text(
                            "My wallet",
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontFamily: fontsSVNGilroyRegular,
                                  color: normalTextColor.withOpacity(0.75),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth(context) * 0.04,
                      vertical: sizeHeight(context) * 0.035,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        WalletButton(
                          iconData: Icons.upload_outlined,
                          title: "Send",
                        ),
                        WalletButton(
                          iconData: Icons.download_outlined,
                          title: "Receive",
                        ),
                        WalletButton(
                          iconData: Icons.monetization_on_outlined,
                          title: "Buy",
                        ),
                        WalletButton(
                          iconData: Icons.currency_exchange_outlined,
                          title: "Trade",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletButton extends StatelessWidget {
  const WalletButton({
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTap(
              onPressed: () {},
              child: Container(
                width: sizeWidth(context) * 0.15,
                height: sizeWidth(context) * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(sizeWidth(context) * 0.15),
                ),
                child: Center(
                  child: Icon(
                    iconData,
                    size: sizeWidth(context) * 0.07,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight(context) * 0.015,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: fontsSVNGilroyRegular,
                    color: normalTextColor.withOpacity(0.9),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
