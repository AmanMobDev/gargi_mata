import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/exports/app_export.dart';

export 'package:intl/date_symbol_data_file.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    Logger.log("data");
  });
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupLocator();
  WidgetsBinding.instance.addPostFrameCallback((_) {});
  // await initializeDateFormatting(
  //   'hi_IN',
  //   null.toString(),
  // ); // Initialize Hindi locale
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(create: (context) => SplashBloc()),
        BlocProvider<JoinBloc>(
          create: (context) => locator<JoinBloc>()..add(GetJoinEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoutes,
        // Add localization support
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('hi', 'IN'), // Hindi Locale
          Locale('en', 'US'), // English (Optional)
        ],
        locale: Locale('hi', 'IN'),
      ),
    );
  }
}
