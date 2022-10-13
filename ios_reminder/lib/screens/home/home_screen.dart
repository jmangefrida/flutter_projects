import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminder/common/widgets/category_icon.dart';
import 'package:ios_reminder/models/category.dart';
import 'package:ios_reminder/models/category_collection.dart';

import 'footer.dart';
import 'grid_view_items.dart';


class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  CategoryCollection  categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Container(
            child: Column(
          children: [
            Expanded(
                child: GridViewItems(categoryCollection: categoryCollection)),
            Footer(),
          ],
        )),
    );
  }
}



