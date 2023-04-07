
import 'package:finance_tracking/models/crypto.dart';
import 'package:finance_tracking/models/crypto_staggered.dart';

import '../retrofit/api_service.dart';

class TrendingNewsListRepository {
  Future<List<TrendingNews>> fetchTrendingNews() async {
    final response = await ApiService.create().getTrendingNews();
    final List<TrendingNews> trendingNewsList = response.trendingNews!;
    return trendingNewsList;
  }
}