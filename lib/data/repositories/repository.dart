abstract class Repository {
  void fetchEverything({String? q, String? sources, String? domains});

  void fetchLatestNews({String? country});
}
