import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/widgets/news_preview_card.dart';
import 'package:news_app/widgets/top_story.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Widget _buildSearchBar() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "NEWS APP",
  //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
  //         child: TextField(
  //           decoration: InputDecoration(
  //             border: OutlineInputBorder(),
  //             hintText: 'Search',
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  SliverToBoxAdapter _buildNews() {
    final newsState = ref.watch(newsNotifierProvider);

    return SliverToBoxAdapter(
      child: newsState.when(
        data:
            (news) => ListView.builder(
              shrinkWrap: true,
              itemBuilder:
                  (context, index) => NewsPreviewCard(article: news[index]),
              itemCount: newsState.value!.length,
            ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }

  SliverAppBar _buildSiliverAppbar() {
    final latestNews = ref.watch(latestNewsNotifierProvider);

    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: latestNews.when(
          data:
              (articles) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Latest News",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TopStory(article: articles.first),
                ],
              ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(slivers: [_buildSiliverAppbar(), _buildNews()]);
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(newsNotifierProvider.notifier).fetchEverything();
      ref.read(latestNewsNotifierProvider.notifier).fetchLatestNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildCustomScrollView()));
    //  Scaffold(
    //   appBar: AppBar(
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           ref.read(userDaoProvider).logOut();
    //         },
    //         icon: Icon(Icons.login_outlined),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(Icons.search),
    //             SizedBox(
    //               width: 100,
    //               height: 30,
    //               child: TextFormField(
    //                 decoration: InputDecoration(border: OutlineInputBorder()),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           "Latest",
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //         ),
    //         latestNewsState.when(
    //           data: (data) => TopStory(article: latestNewsState.value!.first),
    //           error:
    //               (error, stackTrace) => Center(child: Text(error.toString())),
    //           loading: () => Center(child: CircularProgressIndicator()),
    //         ),
    //         Text(
    //           "Hot News",
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(
    //           height: 400,
    //           child: newsState.when(
    //             data:
    //                 (data) => ListView.builder(
    //                   itemBuilder:
    //                       (context, index) =>
    //                           NewsPreviewCard(article: newsState.value![index]),
    //                   itemCount: newsState.value!.length,
    //                 ),
    //             error:
    //                 (error, stackTrace) =>
    //                     Center(child: Text(error.toString())),
    //             loading: () => Center(child: CircularProgressIndicator()),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
