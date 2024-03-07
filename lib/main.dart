import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/routing/router.dart';
import 'package:zain_alhuda/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const ZainAlhuda());
}

class ZainAlhuda extends StatelessWidget {
  const ZainAlhuda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      locale: const Locale('ar'),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xfff8fefe),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent)),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
