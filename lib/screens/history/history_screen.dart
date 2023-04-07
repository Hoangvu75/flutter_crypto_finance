import 'package:finance_tracking/bloc/transactionHistoryList/transaction_history_list_bloc.dart';
import 'package:finance_tracking/bloc/transactionHistoryList/transaction_history_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/transactionHistoryList/transaction_history_list_state.dart';
import '../../generated/color.dart';
import '../../generated/dimension.dart';
import '../../generated/fontFamily.dart';
import 'components/transaction_history_list.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with AutomaticKeepAliveClientMixin<HistoryScreen> {
  late ScrollController _scrollController;
  late bool _scrollControllerOnTopState;

  _scrollListener() {
    if (_scrollController.offset > sizeHeight(context) * 0.1) {
      setState(() {
        _scrollControllerOnTopState = true;
      });
    } else {
      setState(() {
        _scrollControllerOnTopState = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _scrollControllerOnTopState = false;

    context.read<TransactionHistoryListBloc>().add(LoadTransactionHistoryListEvent());
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2), () {
      context.read<TransactionHistoryListBloc>().add(ReloadTransactionHistoryEvent());
    });
  }

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
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: BlocBuilder<TransactionHistoryListBloc, TransactionHistoryListState>(
              builder: (context, transactionHistoryListState) {
                return CustomScrollView(
                  physics: transactionHistoryListState.transactionHistoryList.length <= 3
                      ? const AlwaysScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: sizeHeight(context) * 0.25,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      backgroundColor: _scrollControllerOnTopState ? primaryColor : Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: _scrollControllerOnTopState ? null : EdgeInsets.all(sizeWidth(context) * 0.04),
                        title: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          curve: Curves.ease,
                          duration: const Duration(seconds: 2),
                          builder: (BuildContext context, double tween, Widget? child) {
                            return Opacity(
                              opacity: tween,
                              child: Transform(
                                transform: Matrix4.translationValues(-50 * (1 - tween), 0, 0),
                                child: Text(
                                  "Transaction history",
                                  style: _scrollControllerOnTopState
                                      ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    fontFamily: fontsSVNGilroySemiBold,
                                    color: normalTextColor,
                                  )
                                      : Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    fontFamily: fontsSVNGilroySemiBold,
                                    color: normalTextColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        centerTitle: _scrollControllerOnTopState ? true : false,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: sizeHeight(context) * 0.05,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: sizeWidth(context) * 0.04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 4,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pair",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontFamily: fontsSVNGilroyMedium,
                                      color: greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Price/Avg",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontFamily: fontsSVNGilroyMedium,
                                      color: greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Amount",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontFamily: fontsSVNGilroyMedium,
                                      color: greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TransactionHistoryList(),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: sizeHeight(context) * 0.25,
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
