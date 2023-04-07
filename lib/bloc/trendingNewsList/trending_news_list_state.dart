import '../../models/crypto_staggered.dart';

abstract class TrendingNewsListState {
  final List<TrendingNews> trendingNewsList;
  TrendingNewsListState({required this.trendingNewsList});
}

class TrendingNewsListLoadingState extends TrendingNewsListState {
  TrendingNewsListLoadingState({required super.trendingNewsList});
}

class TrendingNewsListLoadedState extends TrendingNewsListState {
  TrendingNewsListLoadedState({required super.trendingNewsList});
}
