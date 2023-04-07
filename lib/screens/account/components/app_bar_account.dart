import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class AppBarAccount extends StatelessWidget {
  const AppBarAccount({
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
          color: Colors.white.withOpacity(0.1),
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
                right: -sizeWidth(context) * 0.3,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(sizeWidth(context) * 0.04),
                    margin: EdgeInsets.all(sizeWidth(context) * 0.04),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            increasedValueColor.withOpacity(0.75),
                            primaryColor.withOpacity(0.75),
                            decreasedValueColor.withOpacity(0.75),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(sizeWidth(context) * 0.04)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            curve: Curves.ease,
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double tween, Widget? child) {
                              return Transform.scale(
                                scale: tween,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(sizeWidth(context) * 0.2),
                                  child: SizedBox(
                                    width: sizeWidth(context) * 0.2,
                                    height: sizeWidth(context) * 0.2,
                                    child: Image.network(
                                      "https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-6/339083010_896560548263516_8184250699828313246_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Zgb6vU_AheIAX8uAomH&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfCqKfsC3UZo4yl-Ac3RmbYFUViuHOJp1pHpW8n0fc23AA&oe=643071FC",
                                      loadingBuilder:(context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[400]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                        SizedBox(
                          width: sizeWidth(context) * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "VU HUY HOANG",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroySemiBold,
                                color: normalTextColor,
                              ),
                            ),
                            SizedBox(
                              height: sizeHeight(context) * 0.01,
                            ),
                            Text(
                              "******0612",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor.withOpacity(0.75),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ScaleTap(
                          onPressed: () {},
                          child: Icon(
                            Icons.security,
                            size: sizeWidth(context) * 0.09,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(sizeWidth(context) * 0.04),
                    child: Center(
                      child: Text(
                        "Account settings",
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontFamily: fontsSVNGilroySemiBold,
                          color: normalTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
