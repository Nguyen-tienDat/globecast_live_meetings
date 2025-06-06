import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scabld_safe_area_insets/scabld_safe_area_insets.dart';

import 'router/app_router.dart';
import 'services/meeting_service.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupViewportFit();
  
  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  
  runApp(const GlobeCastApp());
}

class GlobeCastApp extends StatelessWidget {
  const GlobeCastApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = GcbAppRouter();
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GcbMeetingService()),
      ],
      child: MaterialApp.router(
      builder: (context, child) {
        return WebSafeAreaInsets(child: child ?? const SizedBox());
      },
        title: 'GlobeCast',
        theme: GcbAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English
        ],
      ),
    );
  }
}