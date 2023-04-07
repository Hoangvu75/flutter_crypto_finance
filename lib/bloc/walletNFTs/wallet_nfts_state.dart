import 'package:finance_tracking/models/wallet_nfts.dart';

abstract class WalletNFTsState {
  final List<NFT> walletNFTList;
  WalletNFTsState({required this.walletNFTList});
}

class WalletNFTsLoadingState extends WalletNFTsState {
  WalletNFTsLoadingState({required super.walletNFTList});
}

class WalletNFTsLoadedState extends WalletNFTsState {
  WalletNFTsLoadedState({required super.walletNFTList});
}
