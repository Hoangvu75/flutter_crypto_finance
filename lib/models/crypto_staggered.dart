import 'dart:convert';

TrendingNewsListResponse trendingNewsListResponseFromJson(String str) => TrendingNewsListResponse.fromJson(json.decode(str));

String trendingNewsListResponseToJson(TrendingNewsListResponse data) => json.encode(data.toJson());

class TrendingNewsListResponse {
  TrendingNewsListResponse({
    this.success,
    this.trendingNews,
  });

  bool? success;
  List<TrendingNews>? trendingNews;

  factory TrendingNewsListResponse.fromJson(Map<String, dynamic> json) => TrendingNewsListResponse(
    success: json["success"],
    trendingNews: List<TrendingNews>.from(json["trending_news"].map((x) => TrendingNews.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "trending_news": List<dynamic>.from(trendingNews!.map((x) => x.toJson())),
  };
}

class TrendingNews {
  TrendingNews({
    this.imageUrl,
    this.title,
    this.content,
  });

  String? imageUrl;
  String? title;
  String? content;

  factory TrendingNews.fromJson(Map<String, dynamic> json) => TrendingNews(
    imageUrl: json["imageUrl"],
    title: json["title"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "title": title,
    "content": content,
  };
}

List<TrendingNews> trendingNewsList = [
  TrendingNews(
    imageUrl: "https://i.pinimg.com/736x/67/ba/3d/67ba3dd1a6e65cbbc46f69fd14a2808a.jpg",
    title: "BTC Price Today",
    content: "Follow live bitcoin prices with the interactive chart and read the latest bitcoin news, analysis and BTC forecasts for expert trading insights."
  ),
  TrendingNews(
      imageUrl: "https://vnn-imgs-a1.vgcloud.vn/znews-photo.zingcdn.me/w860/Uploaded/lce_jwquc/2021_05_03/Ethereum_shutterstock.jpg",
      title: "Ethereum news",
      content: "Get real-time updates and analysis. Informed crypto decisions with Coinlive. Everything Crypto. One-Stop Portal. Types: BTC Price Chart, ETH Price Chart, BNB Price Chart."
  ),
  TrendingNews(
      imageUrl: "https://tintucbitcoin.com/wp-content/uploads/2022/11/bnb-beacoin.jpg",
      title: "BNB Price Prediction",
      content: "According to our BNB price prediction, the price of BNB is predicted to increase by \$16.09 over the next 7 days, reaching \$331.56 by April 8, 2023."
  ),
];