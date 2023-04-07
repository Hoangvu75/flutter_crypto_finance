import 'package:flutter/material.dart';

import '../../../bloc/bottomNavBar/bottom_nav_bar_state.dart';
import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.pageController,
    required this.bottomNavBarState,
  });

  final PageController pageController;
  final BottomNavBarState bottomNavBarState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth(context),
      height: sizeHeight(context) * 0.1,
      padding: EdgeInsets.symmetric(horizontal: sizeWidth(context) * 0.02, vertical: sizeHeight(context) * 0.01),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: SizedBox(
          width: sizeWidth(context) * 0.15,
          height: sizeWidth(context) * 0.15,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: primaryColor,
            onPressed: () {},
            child: Icon(
              Icons.currency_bitcoin,
              size: sizeWidth(context) * 0.095,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(sizeWidth(context) * 0.05),
          child: BottomAppBar(
            color: backgroundColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: sizeWidth(context) * 0.025,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NavButton(
                  pageController: pageController,
                  bottomNavBarState: bottomNavBarState,
                  position: 0,
                  title: "Currency",
                  iconData: Icons.attach_money,
                ),
                NavButton(
                  pageController: pageController,
                  bottomNavBarState: bottomNavBarState,
                  position: 1,
                  title: "Converter",
                  iconData: Icons.history,
                ),
                SizedBox(
                  width: sizeWidth(context) * 0.12,
                ),
                NavButton(
                  pageController: pageController,
                  bottomNavBarState: bottomNavBarState,
                  position: 2,
                  title: "My wallet",
                  iconData: Icons.wallet,
                ),
                NavButton(
                  pageController: pageController,
                  bottomNavBarState: bottomNavBarState,
                  position: 3,
                  title: "Account",
                  iconData: Icons.account_circle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.pageController,
    required this.bottomNavBarState,
    required this.position,
    required this.title,
    required this.iconData,
  });

  final PageController pageController;
  final BottomNavBarState bottomNavBarState;
  final int position;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth(context) * 0.15,
      height: sizeHeight(context) * 0.07,
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          pageController.animateToPage(
            position,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeIn,
          );
        },
        child: Icon(
          iconData,
          color: bottomNavBarState.position == position ? primaryColor : primaryColor.withOpacity(0.5),
          size: sizeWidth(context) * 0.075,
        ),
      ),
    );
  }
}
