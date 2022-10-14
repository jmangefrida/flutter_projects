import 'package:flutter/material.dart';
import 'package:ios_reminder/screens/add_list/add_list_screen.dart';
import 'package:ios_reminder/screens/home/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>HomeScreen(),
        '/addList':(context)=>AddListScreen()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
          brightness: Brightness.dark,
      ),

    );
  }
}
