abstract class CryptoListEvent {
  const CryptoListEvent();
}

class LoadCryptoListEvent extends CryptoListEvent {}

class AddMoreCryptoListEvent extends CryptoListEvent {}

class ReloadCryptoListEvent extends CryptoListEvent {}