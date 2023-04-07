
import 'package:finance_tracking/models/crypto.dart';

import '../retrofit/api_service.dart';

class CryptoListRepository {
  Future<List<Crypto>> fetchCryptoList(String page) async {
    final response = await ApiService.create().getCryptoList(page);
    final List<Crypto> cryptoList = response.crypto!;
    return cryptoList;
  }
}