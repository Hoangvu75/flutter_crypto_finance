import 'package:finance_tracking/generated/dimension.dart';
import 'package:finance_tracking/screens/account/account_screen.dart';
import 'package:finance_tracking/screens/currency/currency_screen.dart';
import 'package:finance_tracking/screens/history/history_screen.dart';
import 'package:finance_tracking/screens/main/components/drawer_user_controller.dart';
import 'package:finance_tracking/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottomNavBar/bottom_nav_bar_bloc.dart';
import '../../bloc/bottomNavBar/bottom_nav_bar_event.dart';
import '../../bloc/bottomNavBar/bottom_nav_bar_state.dart';
import 'components/bottom_nav_bar.dart';
import 'components/home_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> screenList = [
    const CurrencyScreen(),
    const HistoryScreen(),
    const WalletScreen(),
    const AccountScreen(),
  ];

  DrawerIndex? drawerIndex;

  void changeIndex(DrawerIndex drawerIndexData) {
    if (drawerIndex != drawerIndexData) {
      drawerIndex = drawerIndexData;
      switch (drawerIndex) {
        case DrawerIndex.currency:
          pageController.jumpToPage(0);
          break;
        case DrawerIndex.history:
          pageController.jumpToPage(1);
          setState(() {
            drawerIndex = DrawerIndex.history;
          });
          break;
        case DrawerIndex.wallet:
          pageController.jumpToPage(2);
          setState(() {
            drawerIndex = DrawerIndex.wallet;
          });
          break;
        case DrawerIndex.account:
          pageController.jumpToPage(3);
          setState(() {
            drawerIndex = DrawerIndex.account;
          });
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DrawerUserController(
      screenIndex: drawerIndex,
      drawerWidth: sizeWidth(context) * 0.75,
      onDrawerCall: (DrawerIndex drawerIndexData) {
        changeIndex(drawerIndexData);
      },
      screenView: BlocProvider<BottomNavBarBloc>(
        create: (context) => BottomNavBarBloc(),
        child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(builder: (context, bottomNavBarState) {
          return Stack(
            children: [
              Scaffold(
                body: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  itemCount: screenList.length,
                  onPageChanged: (int page) {
                    context.read<BottomNavBarBloc>().add(ChangeBottomNavBarPosition(position: page));
                    if (page == 0) {
                      setState(() {
                        drawerIndex = DrawerIndex.currency;
                      });
                    } else if (page == 1) {
                      setState(() {
                        drawerIndex = DrawerIndex.history;
                      });
                    } else if (page == 2) {
                      setState(() {
                        drawerIndex = DrawerIndex.wallet;
                      });
                    } else if (page == 3) {
                      setState(() {
                        drawerIndex = DrawerIndex.account;
                      });
                    }
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return screenList[index];
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                child: BottomNavBar(
                  pageController: pageController,
                  bottomNavBarState: bottomNavBarState,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
