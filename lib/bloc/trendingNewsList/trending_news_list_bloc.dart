import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finance_tracking/repositories/trending_news_list_repository.dart';

import 'trending_news_list_event.dart';
import 'trending_news_list_state.dart';

class TrendingNewsListBloc extends Bloc<TrendingNewsListEvent, TrendingNewsListState> {
  late final TrendingNewsListRepository _trendingNewsListRepository;

  TrendingNewsListBloc(this._trendingNewsListRepository)
      : super(TrendingNewsListLoadingState(trendingNewsList: [])) {
    on<TrendingNewsListEvent>((event, emit) async {
      if (event is LoadTrendingNewsListEvent) {
        emit(TrendingNewsListLoadingState(trendingNewsList: []));

        final trendingNewsListApi = await _trendingNewsListRepository.fetchTrendingNews();
        emit(TrendingNewsListLoadedState(trendingNewsList: trendingNewsListApi));
      } else if (event is ReloadTrendingNewsListEvent) {
        emit(TrendingNewsListLoadingState(trendingNewsList: []));

        await Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
          () async {
            final trendingNewsListApi = await _trendingNewsListRepository.fetchTrendingNews();
            emit(TrendingNewsListLoadedState(trendingNewsList: trendingNewsListApi));
          },
        );
      }
    });
  }
}
