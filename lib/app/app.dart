import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syau_sewa_mobile/core/localization/generated/app_localizations.dart';
import 'package:syau_sewa_mobile/l10n/l10n.dart';

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      home: Scaffold(
        body: SafeArea(
          child: Center(child: Text(AppLocalizations.of(context)!.helloWorld)),
        ),
      ),
    );
  }
}
