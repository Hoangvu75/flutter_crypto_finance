import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finance_tracking/repositories/transaction_history_repository.dart';
import 'package:finance_tracking/repositories/trending_news_list_repository.dart';
import 'package:finance_tracking/repositories/wallet_coins_repository.dart';

import 'wallet_coins_event.dart';
import 'wallet_coins_state.dart';

class WalletCoinsBloc extends Bloc<WalletCoinsEvent, WalletCoinsState> {
  late final WalletCoinsRepository _walletCoinsRepository;

  WalletCoinsBloc(this._walletCoinsRepository)
      : super(WalletCoinsLoadingState(walletCoinList: [])) {
    on<WalletCoinsEvent>((event, emit) async {
      if (event is LoadWalletCoinsEvent) {
        emit(WalletCoinsLoadingState(walletCoinList: []));

        final walletCoinsApi = await _walletCoinsRepository.fetchWalletCoins();
        emit(WalletCoinsLoadedState(walletCoinList: walletCoinsApi));
      } else if (event is ReloadWalletCoinsEvent) {
        emit(WalletCoinsLoadingState(walletCoinList: []));

        await Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
          () async {
            final walletCoinsApi = await _walletCoinsRepository.fetchWalletCoins();
            emit(WalletCoinsLoadedState(walletCoinList: walletCoinsApi));
          },
        );
      }
    });
  }
}
