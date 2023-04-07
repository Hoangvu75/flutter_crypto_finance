import 'package:bloc/bloc.dart';
import 'package:finance_tracking/repositories/crypto_list_repository.dart';

import '../../models/crypto.dart';
import 'crypto_list_event.dart';
import 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  late final CryptoListRepository _cryptoListRepository;
  String page = "1";
  late final List<Crypto> _cryptoList = [];

  CryptoListBloc(this._cryptoListRepository) : super(CryptoListLoadingState(cryptoList: [])) {
    on<CryptoListEvent>((event, emit) async {
      if (event is LoadCryptoListEvent) {
        emit(CryptoListLoadingState(cryptoList: []));

        final cryptoListApi = await _cryptoListRepository.fetchCryptoList(page);
        _cryptoList.addAll(cryptoListApi);
        emit(CryptoListLoadedState(cryptoList: _cryptoList));
      } else if (event is AddMoreCryptoListEvent) {
        page = (int.parse(page) + 1).toString();

        if (int.parse(page) <= 5) {
          final cryptoListApi = await _cryptoListRepository.fetchCryptoList(page);
          _cryptoList.addAll(cryptoListApi);
          emit(CryptoListLoadedState(cryptoList: _cryptoList));
        }
      } else if (event is ReloadCryptoListEvent) {
        page = "1";
        _cryptoList.clear();
        emit(CryptoListLoadingState(cryptoList: []));

        await Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
          () async {
            final cryptoListApi = await _cryptoListRepository.fetchCryptoList(page);
            _cryptoList.addAll(cryptoListApi);
            emit(CryptoListLoadedState(cryptoList: _cryptoList));
          },
        );
      }
    });
  }
}
