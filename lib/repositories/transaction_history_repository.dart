import 'package:finance_tracking/models/transaction_history.dart';

import '../retrofit/api_service.dart';

class TransactionHistoryRepository {
  Future<List<Transaction>> fetchTransactionHistory() async {
    final response = await ApiService.create().getTransactionHistory();
    final List<Transaction> transactionHistoryList = response.transaction!;
    return transactionHistoryList;
  }
}