import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminder/common/widgets/category_icon.dart';
import 'package:ios_reminder/models/category/category.dart';
import 'package:ios_reminder/models/category/category_collection.dart';
import 'package:ios_reminder/models/common/custom_icon_collection.dart';
import 'package:ios_reminder/models/todo_list/todo_list.dart';
import 'package:ios_reminder/models/todo_list/todo_list_collection.dart';
import 'package:ios_reminder/screens/home/widgets/todo_lists.dart';
import 'package:provider/provider.dart';

import '../../models/common/custom_color_collection.dart';
import 'widgets/footer.dart';
import 'widgets/grid_view_items.dart';
import 'widgets/list_view_items.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryCollection categoryCollection = CategoryCollection();

  String layoutType = 'grid';
  //List<TodoList> todoLists = [];





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (layoutType == 'grid') {
                  setState(() {
                    layoutType = 'list';
                  });
                } else {
                  setState(() {
                    layoutType = 'grid';
                  });
                }
              },
              child: Text(
                layoutType == 'grid' ? 'Edit' : 'Done',
                //style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                crossFadeState: layoutType == 'grid'
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: GridViewItems(
                    categories: categoryCollection.selectedCategories),
                secondChild:
                    ListViewItems(categoryCollection: categoryCollection),
              ),
              //layoutType == 'grid'
              //    ? GridViewItems(categories: categoryCollection.selectedCategories)
              //    : ListViewItems(categoryCollection: categoryCollection)),
              Expanded(
                child: TodoLists(),
              ),
              Footer(),
            ],
          )),
    );
  }
}

