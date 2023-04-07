import 'package:finance_tracking/bloc/trendingNewsList/trending_news_list_bloc.dart';
import 'package:finance_tracking/bloc/trendingNewsList/trending_news_list_event.dart';
import 'package:finance_tracking/bloc/trendingNewsList/trending_news_list_state.dart';
import 'package:finance_tracking/generated/fontFamily.dart';
import 'package:finance_tracking/models/crypto_staggered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class CryptoStaggeredGridView extends StatefulWidget {
  const CryptoStaggeredGridView({
    super.key,
  });

  @override
  State<CryptoStaggeredGridView> createState() => _CryptoStaggeredGridViewState();
}

class _CryptoStaggeredGridViewState extends State<CryptoStaggeredGridView> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingNewsListBloc>().add(LoadTrendingNewsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(sizeWidth(context) * 0.04),
        child: BlocBuilder<TrendingNewsListBloc, TrendingNewsListState>(
          builder: (context, trendingNewsListState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trending news",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontFamily: fontsSVNGilroySemiBold,
                        color: normalTextColor,
                      ),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.02,
                ),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: sizeWidth(context) * 0.02,
                  crossAxisSpacing: sizeWidth(context) * 0.02,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 2,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        curve: Curves.ease,
                        duration: const Duration(seconds: 2),
                        builder: (BuildContext context, double tween, Widget? child) {
                          return Opacity(
                            opacity: tween,
                            child: Transform(
                              transform: Matrix4.translationValues(-50 * (1 - tween), 0, 0),
                              child: (trendingNewsListState is TrendingNewsListLoadingState)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(sizeWidth(context) * 0.05),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[400]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : CryptoStaggeredItem(
                                      cryptoStaggered: trendingNewsListState.trendingNewsList[0],
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        curve: Curves.ease,
                        duration: const Duration(seconds: 2),
                        builder: (BuildContext context, double tween, Widget? child) {
                          return Opacity(
                            opacity: tween,
                            child: Transform(
                              transform: Matrix4.translationValues(50 * (1 - tween), -50 * (1 - tween), 0),
                              child: (trendingNewsListState is TrendingNewsListLoadingState)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(sizeWidth(context) * 0.05),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[400]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : CryptoStaggeredItem(
                                      cryptoStaggered: trendingNewsListState.trendingNewsList[1],
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        curve: Curves.ease,
                        duration: const Duration(seconds: 2),
                        builder: (BuildContext context, double tween, Widget? child) {
                          return Opacity(
                            opacity: tween,
                            child: Transform(
                              transform: Matrix4.translationValues(50 * (1 - tween), 50 * (1 - tween), 0),
                              child: (trendingNewsListState is TrendingNewsListLoadingState)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(sizeWidth(context) * 0.05),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[400]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : CryptoStaggeredItem(
                                      cryptoStaggered: trendingNewsListState.trendingNewsList[2],
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CryptoStaggeredItem extends StatelessWidget {
  const CryptoStaggeredItem({
    super.key,
    required this.cryptoStaggered,
  });

  final TrendingNews? cryptoStaggered;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(sizeWidth(context) * 0.05),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                cryptoStaggered!.imageUrl!,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    backgroundColor.withOpacity(0.2),
                    backgroundColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: sizeHeight(context) * 0.02,
              left: sizeWidth(context) * 0.04,
              right: sizeWidth(context) * 0.04,
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          cryptoStaggered!.title!,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyBold,
                                color: normalTextColor,
                                overflow: TextOverflow.ellipsis,
                                height: sizeHeight(context) * 0.0015,
                              ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sizeHeight(context) * 0.01,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          cryptoStaggered!.content!,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                                overflow: TextOverflow.ellipsis,
                                height: sizeHeight(context) * 0.0015,
                              ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
