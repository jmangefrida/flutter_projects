import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminder/models/todo_list/todo_list.dart';
import 'package:ios_reminder/screens/add_list/add_list_screen.dart';
import 'package:ios_reminder/screens/add_reminder/add_reminder_screen.dart';

class Footer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddReminderScreen(),
                        fullscreenDialog: false));
              },
              icon: Icon(Icons.add_circle),
              label: Text('Add Reminder'),
            ),
            TextButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/addList');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddListScreen(),
                    fullscreenDialog: true));

              },
              child: Text('Add List'),
            )
          ],
        ));
  }
}
