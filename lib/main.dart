import 'package:cuartup/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuartup/View/account_screen.dart';
import 'package:cuartup/View/login_screen.dart';
import 'package:cuartup/View/register_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/account':
            return MaterialPageRoute(builder: (_) => AccountScreen());
          case '/register':
            return MaterialPageRoute(builder: (_) => RegisterScreen());
          case '/login':
            return MaterialPageRoute(builder: (_) => LoginScreen());
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
    );
  }
}
