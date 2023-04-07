import 'package:finance_tracking/models/transaction_history.dart';
import 'package:finance_tracking/models/wallet_coins.dart';

import '../retrofit/api_service.dart';

class WalletCoinsRepository {
  Future<List<Coin>> fetchWalletCoins() async {
    final response = await ApiService.create().getWalletCoins();
    final List<Coin> walletCoins = response.coins!;
    return walletCoins;
  }
}