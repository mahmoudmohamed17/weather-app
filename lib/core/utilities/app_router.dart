import 'package:go_router/go_router.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';
import 'package:weather_app/features/search/presentation/views/search_view.dart';
import 'package:weather_app/features/splash/presentation/views/splash_view.dart';
abstract class AppRouter {
  static String kHomeView = '/homeView';
  static String kSearchView = '/searchView';
 static final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SplashView(),),
  GoRoute(path: kHomeView, builder: (context, state) => const HomeView(),),
  GoRoute(path: kSearchView, builder: (context, state) => const SearchView(),),
 ]);

}

