import 'package:flutter/material.dart';
import 'package:ios_reminder/common/widgets/category_icon.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Reminder'),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Add',
                style: TextStyle(
                    //color: _listName.isEmpty
                    //    ? Colors.grey
                    //    : Colors.blueAccent),
                    ),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Title', border: InputBorder.none),
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Notes', border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
                leading: Text(
                  'List',
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: Row(
                  children: [
                    CategoryIcon(
                        bgColor: Colors.blueAccent,
                        iconData: Icons.calendar_today)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
