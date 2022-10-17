import 'package:flutter/material.dart';
import 'package:ios_reminder/screens/add_list/add_list_screen.dart';
import 'package:ios_reminder/screens/add_reminder/add_reminder_screen.dart';
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
        '/addList':(context)=>AddListScreen(),
        '/addReminder':(context)=>AddReminderScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
          iconTheme: IconThemeData(color: Colors.white),
          accentColor: Colors.white,
          accentIconTheme: IconThemeData(color: Colors.white),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.blueAccent,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              )
            )
          ),
          dividerColor: Colors.grey[600],
          brightness: Brightness.dark,
      ),


    );
  }
}
