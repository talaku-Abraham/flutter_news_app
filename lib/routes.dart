import 'package:go_router/go_router.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/screens/detail_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/screens/search_screen.dart';

List<GoRoute> appRoutes = [
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeScreen(),
    routes: [
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final article = state.extra as Article;

          return DetailScreen(article: article);
        },
      ),
      GoRoute(path: '/search', builder: (context, state) => SearchScreen()),
    ],
  ),
  GoRoute(path: '/login', builder: (context, state) => LogInScreen()),
];
