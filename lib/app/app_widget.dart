import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../generated/l10n.dart';
import 'shared/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      //theme: Modular.get<AppController>().theme?.getTheme() ?? null,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      title: 'We Player!',
      builder: DevicePreview.appBuilder,
      //locale: DevicePreview.of(context).locale,
      //locale: const Locale('en', 'US'),
      supportedLocales: Translate.delegate.supportedLocales,
      localizationsDelegates: [
        Translate.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
