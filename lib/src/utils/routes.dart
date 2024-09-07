import 'package:flutter/material.dart';
import 'package:time_zone/src/views/home_view.dart';

abstract class AppRouter {
  static const String home = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (BuildContext context) => const HomeView(),
  };
}
