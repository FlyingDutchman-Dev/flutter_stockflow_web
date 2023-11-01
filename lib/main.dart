import 'package:flutter/material.dart';
import 'package:flutter_stockflow_web/rotas/rotas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main(){
  runApp(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    initialRoute: "/cadastrar", //Rota Inicial
    routes: Routes.routes,
  ));
  setUrlStrategy(PathUrlStrategy());
}