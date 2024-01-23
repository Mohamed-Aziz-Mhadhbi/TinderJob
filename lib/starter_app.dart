import 'package:provider/provider.dart';
import 'package:tinderjob/l10n/l10n.dart';
import 'package:tinderjob/routes/routes_constants.dart';
import 'package:tinderjob/services/locale_service_provider.dart';
import 'package:tinderjob/themes/themes.dart';
import 'routes/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleServiceProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'StarterApp',
          theme: lightTheme,
          initialRoute: RoutesConstants.splashScreenRoute,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: L10n.allLanguagesSupported,
          onGenerateRoute: router.generateRoute,
        );
      },
    );
  }
}
