import 'package:flutter/material.dart';

class FoodAvatharWidget extends StatefulWidget {
  String imageurl, fooditem;
  FoodAvatharWidget({Key? key, required this.imageurl, required this.fooditem})
      : super(key: key);

  @override
  _FoodAvatharWidgetState createState() => _FoodAvatharWidgetState();
}

class _FoodAvatharWidgetState extends State<FoodAvatharWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 37,
            backgroundImage: NetworkImage(
              widget.imageurl,
            )),
        Text(widget.fooditem)
      ],
    );
  }
}
