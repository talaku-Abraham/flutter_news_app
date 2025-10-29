import 'package:flutter/material.dart';
import 'package:news_app/data/model/source.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.sources});

  final List<SourceOfNews> sources;

  @override
  Widget build(BuildContext context) {
    // final categoryState = ref.watch(sourcesNotifierProvider);

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => SourceItem(source: sources[index]),
        itemCount: sources.length,
      ),
    );
  }
}

class SourceItem extends StatelessWidget {
  const SourceItem({super.key, required this.source});

  final SourceOfNews source;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => ,
      child: ListTile(
        leading: Text(source.id),
        title: Text(source.name),
        subtitle: Text(
          source.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(source.category),
      ),
    );
  }
}
