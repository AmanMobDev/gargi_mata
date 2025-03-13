import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gargi_mata/features/bhajan/presentation/bloc/bhajan_bloc.dart';
import 'package:gargi_mata/features/bhajan/presentation/bloc/bhajan_events.dart';
import 'package:gargi_mata/features/daan/presentation/bloc/daan_bloc.dart';
import 'package:gargi_mata/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:gargi_mata/features/gallery/presentation/bloc/gallery_event.dart';
import 'package:gargi_mata/features/mantra/presentation/bloc/mantra_bloc.dart';
import 'package:gargi_mata/features/mantra/presentation/bloc/mantra_events.dart';
import 'package:gargi_mata/features/samagri/presentation/bloc/samagri_bloc.dart';
import 'package:gargi_mata/features/samagri/presentation/bloc/samagri_event.dart';

import 'config/exports/app_export.dart';
import 'features/bhajan/presentation/bloc/audio_player_bloc.dart';

export 'package:intl/date_symbol_data_file.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    Logger.log("log Data");
  });
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupLocator();
  WidgetsBinding.instance.addPostFrameCallback((_) {});
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
          create:
              (context) => locator<BhajanBloc>()..add(GetBhajanInitialEvent()),
        ),

        BlocProvider<MantraBloc>(
          create: (context) => locator<MantraBloc>()..add(GetMantraEvent()),
        ),

        BlocProvider<AudioPlayerBloc>(
          create: (context) => locator<AudioPlayerBloc>(),
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
