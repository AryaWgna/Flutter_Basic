import 'package:flutter/material.dart';
import 'package:my_flutter_app/views/auth/login_page.dart';
import 'package:my_flutter_app/views/auth/register_page.dart';
import 'package:my_flutter_app/views/home/welcome_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/welcome': (context) => WelcomePage(), // Main page after login
  };
}
