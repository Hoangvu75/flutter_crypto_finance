import 'package:finance_tracking/generated/color.dart';
import 'package:finance_tracking/generated/dimension.dart';
import 'package:flutter/material.dart';

import '../../../generated/app_theme.dart';
import '../../../generated/fontFamily.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key, this.screenIndex, this.iconAnimationController, this.callBackIndex})
      : super(key: key);

  final AnimationController? iconAnimationController;
  final DrawerIndex? screenIndex;
  final Function(DrawerIndex)? callBackIndex;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<DrawerList>? drawerList;

  @override
  void initState() {
    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.currency,
        labelName: 'Currency',
        icon: const Icon(Icons.attach_money),
      ),
      DrawerList(
        index: DrawerIndex.history,
        labelName: 'History',
        icon: const Icon(Icons.history),
      ),
      DrawerList(
        index: DrawerIndex.wallet,
        labelName: 'Wallet',
        icon: const Icon(Icons.wallet),
      ),
      DrawerList(
        index: DrawerIndex.account,
        labelName: 'Account',
        icon: const Icon(Icons.account_circle_outlined),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: sizeWidth(context) * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return ScaleTransition(
                        scale: AlwaysStoppedAnimation<double>(1.0 - (widget.iconAnimationController!.value) * 0.2),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation<double>(Tween<double>(begin: 0.0, end: 24.0)
                                  .animate(CurvedAnimation(
                                      parent: widget.iconAnimationController!, curve: Curves.fastOutSlowIn))
                                  .value /
                              360),
                          child: Container(
                            height: sizeWidth(context) * 0.3,
                            width: sizeWidth(context) * 0.3,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: AppTheme.grey.withOpacity(0.6),
                                    offset: const Offset(2.0, 4.0),
                                    blurRadius: 8),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(sizeWidth(context) * 0.3)),
                              child: Image.network(
                                  "https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-6/339083010_896560548263516_8184250699828313246_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Zgb6vU_AheIAX8uAomH&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfCqKfsC3UZo4yl-Ac3RmbYFUViuHOJp1pHpW8n0fc23AA&oe=643071FC"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: sizeHeight(context) * 0.025,
                    ),
                    child: Text(
                      'VU HUY HOANG',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: fontsSVNGilroySemiBold,
                            color: normalTextColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(1),
              thickness: sizeHeight(context) * 0.002,
            ),
            SizedBox(
              height: sizeHeight(context) * 0.025,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0.0),
                itemCount: drawerList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return inkwell(drawerList![index]);
                },
              ),
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(1),
              thickness: sizeHeight(context) * 0.002,
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Sign Out',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: fontsSVNGilroySemiBold,
                          color: Colors.red,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: const Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          callBack(listData.index!);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    width: sizeWidth(context) * 0.015,
                    height: sizeHeight(context) * 0.05,
                    decoration: BoxDecoration(
                      color: widget.screenIndex == listData.index ? primaryColor : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sizeWidth(context) * 0.04,
                  ),
                  listData.isAssetsImage
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName,
                              color: widget.screenIndex == listData.index ? primaryColor : Colors.white),
                        )
                      : Icon(listData.icon?.icon,
                          color: widget.screenIndex == listData.index ? primaryColor : greyTextColor),
                  SizedBox(
                    width: sizeWidth(context) * 0.04,
                  ),
                  Text(
                    listData.labelName,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: fontsSVNGilroySemiBold,
                          color: widget.screenIndex == listData.index ? primaryColor : greyTextColor,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.screenIndex == listData.index
                ? AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                          (MediaQuery.of(context).size.width * 0.75 - 64) *
                              (1 - widget.iconAnimationController!.value - 1),
                          0,
                          0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75 - 64,
                            height: sizeHeight(context) * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> callBack(DrawerIndex indexScreen) async {
    widget.callBackIndex!(indexScreen);
  }
}

enum DrawerIndex { currency, wallet, history, account }

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex? index;
}
