import 'package:flutter/foundation.dart';

import 'config/exports/app_export.dart';
import 'features/bhajan/presentation/bloc/play_bhajan/play_bhajan_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    // Logger.log("log Data");
  });
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupLocator();
  WidgetsBinding.instance.addPostFrameCallback((_) {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(create: (context) => SplashBloc()),
        BlocProvider<JoinBloc>(
          create: (context) => locator<JoinBloc>()..add(GetJoinEvent()),
        ),
        BlocProvider<DaanBloc>(
          create: (context) => locator<DaanBloc>()..add(GetDaanEvent()),
        ),
        BlocProvider<SamagriBloc>(
          create: (context) => locator<SamagriBloc>()..add(GetSamagriEvent()),
        ),

        BlocProvider<HomeBloc>(
          create: (context) => locator<HomeBloc>()..add(GetHomeEvent()),
        ),

        BlocProvider<GalleryBloc>(
          create: (context) => locator<GalleryBloc>()..add(GetGalleryEvents()),
        ),

        BlocProvider<BhajanBloc>(
          create: (context) => locator<BhajanBloc>()..add(LoadAudioList()),
        ),

        BlocProvider<MantraBloc>(
          create: (context) => locator<MantraBloc>()..add(GetMantraEvent()),
        ),

        BlocProvider<VidhiBloc>(
          create: (context) => locator<VidhiBloc>()..add(GetVidhiEvent()),
        ),

        BlocProvider<HistoryBloc>(
          create: (context) => locator<HistoryBloc>()..add(GetHistoryEvent()),
        ),
        BlocProvider<MusicBloc>(create: (context) => MusicBloc()),
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
