// lib/core/navigation/router.dart

import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/home_page.dart';
import 'routes.dart';

class AppRouter {
  static const String initialRoute = Routes.home;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

    // Add more routes as they're implemented
    // case Routes.player:
    //   return MaterialPageRoute(builder: (_) => const PlayerPage());
    // case Routes.search:
    //   return MaterialPageRoute(builder: (_) => const SearchPage());
    // case Routes.profile:
    //   return MaterialPageRoute(builder: (_) => const ProfilePage());
    // case Routes.downloads:
    //   return MaterialPageRoute(builder: (_) => const DownloadsPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}