import 'package:finance_tracking/models/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../bloc/transactionHistoryList/transaction_history_list_bloc.dart';
import '../../../bloc/transactionHistoryList/transaction_history_list_event.dart';
import '../../../bloc/transactionHistoryList/transaction_history_list_state.dart';
import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<TransactionHistoryListBloc, TransactionHistoryListState>(
        builder: (context, transactionHistoryListState) {
          if (transactionHistoryListState is TransactionHistoryListLoadingState) {
            return Container();
          } else if (transactionHistoryListState is TransactionHistoryListLoadedState) {
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List<TransactionItem>.generate(
                transactionHistoryListState.transactionHistoryList.length,
                    (index) {
                  return TransactionItem(
                    index: index,
                    transaction: transactionHistoryListState.transactionHistoryList[index],
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        }
      ),
    );
  }
}

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.index,
    required this.transaction,
  });

  final int index;
  final Transaction transaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addListener(() => setState(() {}));

    Future.delayed(Duration(milliseconds: widget.index * 200), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizeHeight(context) * 0.015,
        ),
        Divider(
          color: greyTextColor,
          thickness: 1,
        ),
        SizedBox(
          height: sizeHeight(context) * 0.015,
        ),
        Opacity(
          opacity: _animation.value,
          child: Transform(
            transform: Matrix4.translationValues(0, -50.0 * (1 - _animation.value), 0),
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                context
                    .read<TransactionHistoryListBloc>()
                    .add(RemoveTransactionItemEvent(transaction: widget.transaction));
              },
              child: ScaleTap(
                onPressed: () {},
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${widget.transaction.tradingCrypto![0].name}/${widget.transaction.tradingCrypto![1].name}",
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        fontFamily: fontsSVNGilroySemiBold,
                                        color: normalTextColor,
                                      ),
                                ),
                                SizedBox(
                                  width: sizeWidth(context) * 0.02,
                                ),
                                Text(
                                  "${widget.transaction.transactionStatus}",
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        fontFamily: fontsSVNGilroySemiBold,
                                        color: widget.transaction.transactionStatus == "Sell"
                                            ? decreasedValueColor
                                            : increasedValueColor,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: sizeHeight(context) * 0.01,
                            ),
                            Text(
                              "${widget.transaction.transactionDate}",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontFamily: fontsSVNGilroyRegular,
                                  color: greyTextColor,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: sizeHeight(context) * 0.005,
                            ),
                            Text(
                              "${widget.transaction.transactionHour}",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontFamily: fontsSVNGilroyRegular,
                                  color: greyTextColor,
                                  fontStyle: FontStyle.italic),
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
                              "${widget.transaction.tradingCrypto![0].price}",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontFamily: fontsSVNGilroyMedium,
                                    color: normalTextColor,
                                  ),
                            ),
                            SizedBox(
                              height: sizeHeight(context) * 0.005,
                            ),
                            Text(
                              "${widget.transaction.tradingCrypto![1].price}",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontFamily: fontsSVNGilroyMedium,
                                    color: normalTextColor,
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
                              "${widget.transaction.tradingCrypto![0].amount}",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontFamily: fontsSVNGilroyMedium,
                                    color: normalTextColor,
                                  ),
                            ),
                            SizedBox(
                              height: sizeHeight(context) * 0.005,
                            ),
                            Text(
                              "${widget.transaction.tradingCrypto![1].amount}",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontFamily: fontsSVNGilroyMedium,
                                    color: normalTextColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
