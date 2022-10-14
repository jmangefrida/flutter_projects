import 'package:flutter/material.dart';

class AddListScreen extends StatefulWidget {

  @override
  _AddListScreenState createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New List'),
        actions: [
          TextButton(onPressed: (){}, child: Text('Add'),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Icon(Icons.home, size: 75,),
              ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)),
              child: TextField(
                textAlign: TextAlign.center,
                autofocus: true, style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                    child: Icon(Icons.clear))
              ),),
            )
          ],
        ),
      ),
    );
  }
}