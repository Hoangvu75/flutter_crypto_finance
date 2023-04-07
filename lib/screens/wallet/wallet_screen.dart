import 'package:finance_tracking/bloc/walletCoins/wallet_coins_bloc.dart';
import 'package:finance_tracking/bloc/walletCoins/wallet_coins_event.dart';
import 'package:finance_tracking/bloc/walletNFTs/wallet_nfts_bloc.dart';
import 'package:finance_tracking/bloc/walletNFTs/wallet_nfts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/color.dart';
import '../../generated/dimension.dart';
import 'components/app_bar_wallet.dart';
import 'components/wallet_list.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with AutomaticKeepAliveClientMixin<WalletScreen> {
  @override
  void initState() {
    super.initState();

    context.read<WalletCoinsBloc>().add(LoadWalletCoinsEvent());
    context.read<WalletNFTsBloc>().add(LoadWalletNFTsEvent());
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2), () {
      context.read<WalletCoinsBloc>().add(ReloadWalletCoinsEvent());
      context.read<WalletNFTsBloc>().add(ReloadWalletNFTsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: sizeWidth(context),
          height: sizeHeight(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColor,
                backgroundColor.withOpacity(0.9),
              ],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: false,
                  snap: false,
                  floating: false,
                  expandedHeight: sizeHeight(context) * 0.35,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: const AppBarWallet(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: sizeHeight(context) * 0.05,
                  ),
                ),
                const WalletList(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: sizeHeight(context) * 0.25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}