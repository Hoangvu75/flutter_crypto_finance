import 'package:finance_tracking/models/transaction_history.dart';

abstract class TransactionHistoryListEvent {
  const TransactionHistoryListEvent();
}

class LoadTransactionHistoryListEvent extends TransactionHistoryListEvent {}

class ReloadTransactionHistoryEvent extends TransactionHistoryListEvent {}

class RemoveTransactionItemEvent extends TransactionHistoryListEvent {
  final Transaction transaction;
  RemoveTransactionItemEvent({required this.transaction});
}