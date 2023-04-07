import 'package:finance_tracking/models/wallet_coins.dart';

abstract class WalletCoinsState {
  final List<Coin> walletCoinList;
  WalletCoinsState({required this.walletCoinList});
}

class WalletCoinsLoadingState extends WalletCoinsState {
  WalletCoinsLoadingState({required super.walletCoinList});
}

class WalletCoinsLoadedState extends WalletCoinsState {
  WalletCoinsLoadedState({required super.walletCoinList});
}
