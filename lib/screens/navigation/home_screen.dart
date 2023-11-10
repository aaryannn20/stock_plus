import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:stock_plus/widgets/articles/article_list.dart';
import 'package:stock_plus/widgets/error_banner.dart';
import '../../providers/articles.dart';
import '../../widgets/shimmer/news_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _articleFuture;

  @override
  void initState() {
    _articleFuture =
        Provider.of<Articles>(context, listen: false).fetchArticles();
    super.initState();
  }

  Future<void> _refresh() async {
    await Provider.of<Articles>(context, listen: false).fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Articles>(context).items;

    return FutureBuilder(
      future: _articleFuture,
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? const NewsShimmer()
          : snapshot.hasError
              ? const ErrorBanner(text: "Something Went Wrong!")
              : RefreshIndicator(
                  onRefresh: _refresh,
                  color: Theme.of(context).primaryColor,
                  child: SingleChildScrollView(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 10),
                      child: ArticleList(items),
                    ),
                  ),
                ),
    );
  }
}
