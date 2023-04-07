abstract class TrendingNewsListEvent {
  const TrendingNewsListEvent();
}

class LoadTrendingNewsListEvent extends TrendingNewsListEvent {}

class ReloadTrendingNewsListEvent extends TrendingNewsListEvent {}