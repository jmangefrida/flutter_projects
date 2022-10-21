import 'package:flutter/material.dart';
import 'package:ios_reminder/models/common/custom_color.dart';
import 'package:ios_reminder/models/common/custom_color_collection.dart';
import 'package:ios_reminder/models/common/custom_icon.dart';
import 'package:ios_reminder/models/common/custom_icon_collection.dart';
import 'package:ios_reminder/models/todo_list/todo_list.dart';
import 'package:provider/provider.dart';

import '../../models/todo_list/todo_list_collection.dart';

class AddListScreen extends StatefulWidget {
  @override
  _AddListScreenState createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  CustomColor selectedColor = CustomColorCollection().colors.first;
  CustomIcon selectedIcon = CustomIconCollection().icons.first;

  TextEditingController _textController = TextEditingController();

  String _listName = '';

  @override
  void initState(){
    super.initState();
    _textController.addListener(() {
      //print(textController.text);
      setState(() {
        _listName = _textController.text;
      });

    });
  }

  @override
  void dispose(){
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New List'),
        actions: [
          TextButton(
            onPressed: _listName.isEmpty? null : () {
              if (_textController.text.isNotEmpty) {
                //print('add to database');
                Provider.of<TodoListCollection>(context, listen: false).addTodoList(TodoList(id: DateTime.now().toString(), title: _textController.text, icon: {'id': selectedIcon.id, 'color': selectedColor.id}));
                Navigator.pop(context );
              } else {
                print('Please enter a list name');
              }
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: selectedColor.color),
              child: Icon(
                selectedIcon.icon,
                size: 75,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _textController,
                textAlign: TextAlign.center,
                autofocus: true,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () => _textController.clear(),
                      icon: Container(

                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          child: Icon(Icons.clear)),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customColor in CustomColorCollection().colors)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = customColor;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: selectedColor.id == customColor.id
                              ? Border.all(color: Colors.grey[600]!, width: 4)
                              : null,
                          color: customColor.color,
                          shape: BoxShape.circle),
                    ),
                  )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customIcon in CustomIconCollection().icons)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIcon = customIcon;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: selectedIcon.id == customIcon.id
                              ? Border.all(color: Colors.grey[600]!, width: 4)
                              : null,
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle),
                      child: Icon(customIcon.icon),
                    ),
                  )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
