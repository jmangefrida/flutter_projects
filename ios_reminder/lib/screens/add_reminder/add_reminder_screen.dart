import 'package:flutter/material.dart';
import 'package:ios_reminder/common/widgets/category_icon.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {

  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _notesTextController = TextEditingController();

  String _title = '';

  @override
  void initState(){
    super.initState();
    _titleTextController.addListener(() {
      //print(textController.text);
      setState(() {
        _title = _titleTextController.text;
      });

    });
  }

  @override
  void dispose(){
    super.dispose();
    _titleTextController.dispose();
    _notesTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Reminder'),
        actions: [
          TextButton(
              onPressed: _title.isEmpty? null: () {
                print('add to db');
              },
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
                    textCapitalization: TextCapitalization.sentences,
                    controller: _titleTextController,
                    decoration: InputDecoration(
                        hintText: 'Title', border: InputBorder.none),
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _notesTextController,
                      decoration: InputDecoration(
                          hintText: 'Notes', border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              tileColor: Theme.of(context).cardColor,
              onTap: (){},
              leading: Text('List', style: Theme.of(context).textTheme.headline6,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CategoryIcon(bgColor: Colors.blueAccent, iconData: Icons.calendar_today),
                  SizedBox(width: 10,),
                  Text('New List'),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),

            ),
            SizedBox(height: 20,),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              tileColor: Theme.of(context).cardColor,
              onTap: (){},
              leading: Text('Category', style: Theme.of(context).textTheme.headline6,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CategoryIcon(bgColor: Colors.blueAccent, iconData: Icons.calendar_today),
                  SizedBox(width: 10,),
                  Text('Scheduled'),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
