import 'package:finance_tracking/models/transaction_history.dart';

abstract class TransactionHistoryListState {
  final List<Transaction> transactionHistoryList;
  TransactionHistoryListState({required this.transactionHistoryList});
}

class TransactionHistoryListLoadingState extends TransactionHistoryListState {
  TransactionHistoryListLoadingState({required super.transactionHistoryList});
}

class TransactionHistoryListLoadedState extends TransactionHistoryListState {
  TransactionHistoryListLoadedState({required super.transactionHistoryList});
}
