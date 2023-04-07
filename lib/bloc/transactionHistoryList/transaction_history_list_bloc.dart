import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finance_tracking/repositories/transaction_history_repository.dart';
import 'package:finance_tracking/repositories/trending_news_list_repository.dart';

import 'transaction_history_list_event.dart';
import 'transaction_history_list_state.dart';

class TransactionHistoryListBloc extends Bloc<TransactionHistoryListEvent, TransactionHistoryListState> {
  late final TransactionHistoryRepository _transactionHistoryRepository;

  TransactionHistoryListBloc(this._transactionHistoryRepository)
      : super(TransactionHistoryListLoadingState(transactionHistoryList: [])) {
    on<TransactionHistoryListEvent>((event, emit) async {
      if (event is LoadTransactionHistoryListEvent) {
        emit(TransactionHistoryListLoadingState(transactionHistoryList: []));

        final transactionHistoryListApi = await _transactionHistoryRepository.fetchTransactionHistory();
        emit(TransactionHistoryListLoadedState(transactionHistoryList: transactionHistoryListApi));
      } else if (event is ReloadTransactionHistoryEvent) {
        emit(TransactionHistoryListLoadingState(transactionHistoryList: []));

        await Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
          () async {
            final transactionHistoryListApi = await _transactionHistoryRepository.fetchTransactionHistory();
            emit(TransactionHistoryListLoadedState(transactionHistoryList: transactionHistoryListApi));
          },
        );
      } else if (event is RemoveTransactionItemEvent) {
        final currentState = state as TransactionHistoryListLoadedState;
        final newTransactionList = currentState.transactionHistoryList.toList()..remove(event.transaction);
        emit(TransactionHistoryListLoadedState(transactionHistoryList: newTransactionList));
      }
    });
  }
}
