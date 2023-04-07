import 'package:finance_tracking/bloc/transactionHistoryList/transaction_history_list_bloc.dart';
import 'package:finance_tracking/bloc/trendingNewsList/trending_news_list_bloc.dart';
import 'package:finance_tracking/bloc/walletCoins/wallet_coins_bloc.dart';
import 'package:finance_tracking/bloc/walletNFTs/wallet_nfts_bloc.dart';
import 'package:finance_tracking/repositories/crypto_list_repository.dart';
import 'package:finance_tracking/repositories/transaction_history_repository.dart';
import 'package:finance_tracking/repositories/trending_news_list_repository.dart';
import 'package:finance_tracking/repositories/wallet_coins_repository.dart';
import 'package:finance_tracking/repositories/wallet_nfts_repository.dart';
import 'package:finance_tracking/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cryptoList/crypto_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CryptoListRepository>(
            create: (context) => CryptoListRepository(),
          ),
          RepositoryProvider<TrendingNewsListRepository>(
            create: (context) => TrendingNewsListRepository(),
          ),
          RepositoryProvider<TransactionHistoryRepository>(
            create: (context) => TransactionHistoryRepository(),
          ),
          RepositoryProvider<WalletCoinsRepository>(
            create: (context) => WalletCoinsRepository(),
          ),
          RepositoryProvider<WalletNFTsRepository>(
            create: (context) => WalletNFTsRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CryptoListBloc>(
              create: (context) => CryptoListBloc(RepositoryProvider.of<CryptoListRepository>(context)),
            ),
            BlocProvider<TrendingNewsListBloc>(
              create: (context) => TrendingNewsListBloc(RepositoryProvider.of<TrendingNewsListRepository>(context)),
            ),
            BlocProvider<TransactionHistoryListBloc>(
              create: (context) => TransactionHistoryListBloc(RepositoryProvider.of<TransactionHistoryRepository>(context)),
            ),
            BlocProvider<WalletCoinsBloc>(
              create: (context) => WalletCoinsBloc(RepositoryProvider.of<WalletCoinsRepository>(context)),
            ),
            BlocProvider<WalletNFTsBloc>(
              create: (context) => WalletNFTsBloc(RepositoryProvider.of<WalletNFTsRepository>(context)),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}
