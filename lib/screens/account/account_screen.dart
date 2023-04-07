import 'package:flutter/material.dart';

import '../../generated/color.dart';
import '../../generated/dimension.dart';
import '../../generated/fontFamily.dart';
import 'components/app_bar_account.dart';
import 'components/log_out_button.dart';
import 'components/security_widget.dart';
import 'components/transaction_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with AutomaticKeepAliveClientMixin<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: sizeWidth(context),
          height: sizeHeight(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColor,
                backgroundColor.withOpacity(0.9),
              ],
            ),
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: false,
                snap: false,
                floating: false,
                expandedHeight: sizeHeight(context) * 0.35,
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: const AppBarAccount(),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sizeHeight(context) * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeWidth(context) * 0.04,
                        vertical: sizeHeight(context) * 0.02,
                      ),
                      child: Text(
                        "Transaction method",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontFamily: fontsSVNGilroySemiBold,
                              color: normalTextColor,
                            ),
                      ),
                    ),
                    const TransactionWidget(),
                    SizedBox(
                      height: sizeHeight(context) * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeWidth(context) * 0.04,
                        vertical: sizeHeight(context) * 0.02,
                      ),
                      child: Text(
                        "Security settings",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontFamily: fontsSVNGilroySemiBold,
                              color: normalTextColor,
                            ),
                      ),
                    ),
                    const SecurityWidget(),
                    SizedBox(
                      height: sizeHeight(context) * 0.05,
                    ),
                    const LogOutButton(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: sizeHeight(context) * 0.25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}



