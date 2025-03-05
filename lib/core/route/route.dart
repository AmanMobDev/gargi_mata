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

      case RouteName.samagriScreen:
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
