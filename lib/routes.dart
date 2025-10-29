import 'package:go_router/go_router.dart';
import 'package:news_app/containers/category_container.dart';
import 'package:news_app/containers/latest_news_container.dart';
import 'package:news_app/containers/source_container.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/screens/detail_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/screens/signup_page.dart';

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

      GoRoute(
        path: '/latest',
        builder: (context, state) {
          return LatestNewsContainer();
        },
      ),
      GoRoute(
        path: '/category',
        builder: (context, state) {
          final category = state.extra as String;
          return CategoryContainer(category: category);
        },
      ),
      GoRoute(
        path: '/source',
        builder: (context, state) {
          return SourceContainer();
        },
      ),
    ],
  ),

  GoRoute(path: '/login', builder: (context, state) => LogInScreen()),
  GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
];
