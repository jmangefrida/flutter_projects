import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminder/screens/add_list/add_list_screen.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
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
