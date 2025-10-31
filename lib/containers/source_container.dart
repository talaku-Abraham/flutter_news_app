import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/service_provider.dart';
import 'package:news_app/screens/sources_screen.dart';

class SourceContainer extends ConsumerWidget {
  const SourceContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(sourceOfNewsProvider);
    return categoryState.when(
      data: (sources) => SourcesScreen(sources: sources),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
