import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stockflow_web/rotas/rotas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    initialRoute: "/cadastrar", //Rota Inicial
    routes: Routes.routes,
  ));
  setUrlStrategy(PathUrlStrategy());
}