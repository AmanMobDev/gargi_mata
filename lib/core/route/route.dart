import 'package:gargi_mata/features/bhajan/presentation/screen/play_bhajan.dart';

import '../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.baseScreen:
        return MaterialPageRoute(builder: (context) => BaseScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.historyScreen:
        return MaterialPageRoute(builder: (context) => HistoryScreen());
      case RouteName.joinScreen:
        return MaterialPageRoute(builder: (context) => JoinScreen());
      case RouteName.galleryScreen:
        return MaterialPageRoute(builder: (context) => GalleryScreen());

      case RouteName.vidhiViewScreen:
        return MaterialPageRoute(builder: (context) => VidhiScreen());

      case RouteName.playBhajanScreen:
        final args = settings.arguments as Map<String, dynamic>?;

        if (args == null || !args.containsKey("bhajan")) {
          // ✅ Return a default route (e.g., home screen) instead of null
          return MaterialPageRoute(
            builder: (context) => HomeScreen(), // Change to any fallback screen
          );
        }

        return MaterialPageRoute(
          builder: (context) => PlayBhajanScreen(bhajan: args["bhajan"]),
          settings: settings,
        );
      case RouteName.samagriScreen:
        return PageRouteBuilder(
          pageBuilder:
              (context, animation, secondaryAnimation) => SamagriScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Slide from right
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

        return MaterialPageRoute(builder: (context) => SamagriScreen());

      case RouteName.mantraScreen:
        return MaterialPageRoute(builder: (context) => MantraScreen());

      case RouteName.panchangScreen:
        return MaterialPageRoute(builder: (context) => PanchangScreen());

      case RouteName.daanScreen:
        return MaterialPageRoute(builder: (context) => DaanScreen());

      case RouteName.bhajanScreen:
        return MaterialPageRoute(builder: (context) => BhajanScreen());

      case RouteName.photoViewScreen:
        return MaterialPageRoute(
          builder: (context) => PhotoViewScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(child: TextWidget(value: AppStrings.noRoute)),
            );
          },
        );
    }
  }
}
