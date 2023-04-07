import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finance_tracking/repositories/wallet_nfts_repository.dart';

import 'wallet_nfts_event.dart';
import 'wallet_nfts_state.dart';

class WalletNFTsBloc extends Bloc<WalletNFTsEvent, WalletNFTsState> {
  late final WalletNFTsRepository _walletNFTsRepository;

  WalletNFTsBloc(this._walletNFTsRepository)
      : super(WalletNFTsLoadingState(walletNFTList: [])) {
    on<WalletNFTsEvent>((event, emit) async {
      if (event is LoadWalletNFTsEvent) {
        emit(WalletNFTsLoadingState(walletNFTList: []));

        final walletNFTsApi = await _walletNFTsRepository.fetchWalletNFTs();
        emit(WalletNFTsLoadedState(walletNFTList: walletNFTsApi));
      } else if (event is ReloadWalletNFTsEvent) {
        emit(WalletNFTsLoadingState(walletNFTList: []));

        await Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
          () async {
            final walletNFTsApi = await _walletNFTsRepository.fetchWalletNFTs();
            emit(WalletNFTsLoadedState(walletNFTList: walletNFTsApi));
          },
        );
      }
    });
  }
}
