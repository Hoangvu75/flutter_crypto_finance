import 'package:finance_tracking/models/transaction_history.dart';

abstract class WalletCoinsEvent {
  const WalletCoinsEvent();
}

class LoadWalletCoinsEvent extends WalletCoinsEvent {}

class ReloadWalletCoinsEvent extends WalletCoinsEvent {}