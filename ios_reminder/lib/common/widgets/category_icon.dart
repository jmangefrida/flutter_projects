import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  //const CategoryIcon({Key? key}) : super(key: key);

  final dynamic bgColor;
  final IconData iconData;

  CategoryIcon({required this.bgColor, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Icon(
        iconData,
        size: 30,
        //color: Colors.white,
      ),
    );
  }
}
