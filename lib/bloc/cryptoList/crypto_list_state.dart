import 'package:finance_tracking/models/crypto.dart';

abstract class CryptoListState {
  final List<Crypto> cryptoList;
  CryptoListState({required this.cryptoList});
}

class CryptoListLoadingState extends CryptoListState {
  CryptoListLoadingState({required super.cryptoList});
}

class CryptoListLoadedState extends CryptoListState {
  CryptoListLoadedState({required super.cryptoList});
}
