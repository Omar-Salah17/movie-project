import 'package:flutter/material.dart';
// import 'package:movies_app/features/browse/presentation/view/browse_screen.dart';
import 'package:movies_app/features/home/presentation/view/home_screen.dart';
// import 'package:movies_app/features/home/presentation/view/movie_details.dart';
// import 'package:movies_app/features/search/presentation/view/search_screen.dart';
import 'package:movies_app/features/splash/presentation/view/splash_screen.dart';
// import 'package:movies_app/features/watchlist/presentation/view/watchlist_screen.dart';

class AppRouter {
  static const kHomeScreen = '/homeScreen';
  static const kHomeDetailsScreen = '/movieDetails';
  // static const kSearchScreen = '/searchScreen';
  // static const kBrowseScreen = '/browseScreen';
  // static const kWatchListScreen = '/watchListScreen';
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case kHomeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      // case kHomeDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const MovieDetailsScreen(
      //       id: 3172,
      //     ),
      //   );
      // case kSearchScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SeacrhScreen(),
      //   );
      // case kBrowseScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const BrowseScreen(),
      //   );
      // case kWatchListScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const WatchListScreen(),
      //   );
    }
    return null;
  }
}
