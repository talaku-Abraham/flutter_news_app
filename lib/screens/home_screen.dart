import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/provider.dart';
import 'package:news_app/widgets/news_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(repositoryProvider.notifier).fetchEverything();
      ref.read(repositoryProvider.notifier).fetchLatestNews();
    });
  }

  Widget _buildSearchBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "NEWS APP",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTreadingSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Treading", style: TextStyle(fontWeight: FontWeight.bold)),

          TextButton(onPressed: () {}, child: Text("See all")),
        ],
      ),
    );
  }

  Widget _buildLatestNews(String imageUrl, String description, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 50,
            child: _buildImage(imageUrl: imageUrl),
          ),

          Expanded(child: NewsCard(description: description, title: title)),
        ],
      ),
    );
  }

  Widget _buildImage({required String imageUrl}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildTreadingSections(),
        _buildLatestNewsSection(
          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "dfdf",
          "dfndsnfdsf",
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildLatestNews(
              "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              "dfdfakdfdsfdf dfnoasdn",
              "This is the title i want to display ladies and gentlemens ",
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildImageCard(String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: _buildImage(imageUrl: imageUrl),
        ),

        NewsCard(
          description: "description",
          title: "this is a pic of a gfnsda taking a picture",
        ),
      ],
    );
  }

  SliverToBoxAdapter _buildTreadingSections() {
    return SliverToBoxAdapter(child: _buildTreadingSection());
  }

  SliverToBoxAdapter _buildLatestNewsSection(
    String imageUrl,
    String description,
    String title,
  ) {
    return SliverToBoxAdapter(child: _buildImageCard(imageUrl));
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 100,

      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Center(child: _buildSearchBar()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(repositoryProvider);

    return Scaffold(body: _buildCustomScrollView());
  }
}
