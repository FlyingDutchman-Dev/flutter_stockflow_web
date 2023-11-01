import 'package:flutter/material.dart';
import 'package:flutter_stockflow_web/telas/cadastrar/widget_principal/cadastrar.dart';
import 'package:flutter_stockflow_web/telas/home/widget_principal/home.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const Home(),
    '/cadastrar': (context) => const Cadastrar(),
  };
}