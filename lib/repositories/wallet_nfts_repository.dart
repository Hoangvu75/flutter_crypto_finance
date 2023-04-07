import 'package:finance_tracking/models/transaction_history.dart';
import 'package:finance_tracking/models/wallet_coins.dart';
import 'package:finance_tracking/models/wallet_nfts.dart';

import '../retrofit/api_service.dart';

class WalletNFTsRepository {
  Future<List<NFT>> fetchWalletNFTs() async {
    final response = await ApiService.create().getWalletNFTs();
    final List<NFT> walletNFTs = response.nfts!;
    return walletNFTs;
  }
}