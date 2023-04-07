import 'package:dio/dio.dart';
import 'package:finance_tracking/models/crypto.dart';
import 'package:finance_tracking/models/transaction_history.dart';
import 'package:finance_tracking/models/wallet_coins.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../models/crypto_staggered.dart';
import '../models/wallet_nfts.dart';

part 'api_service.g.dart';

const BASE_URL = "https://currency-tracking-server.fly.dev/";
@RestApi(baseUrl: BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.interceptors.add(PrettyDioLogger());

    return ApiService(
      dio,
      baseUrl: BASE_URL,
    );
  }

  @GET("/crypto/crypto-list")
  Future<CryptoListResponse> getCryptoList(@Query("page") String page);

  @GET("/news/trending-news")
  Future<TrendingNewsListResponse> getTrendingNews();

  @GET("/transaction/history")
  Future<TransactionHistoryResponse> getTransactionHistory();

  @GET("/wallet/coins")
  Future<WalletCoinsResponse> getWalletCoins();

  @GET("/wallet/nfts")
  Future<WalletNfTsResponse> getWalletNFTs();
}

// flutter packages pub run build_runner build --delete-conflicting-outputs