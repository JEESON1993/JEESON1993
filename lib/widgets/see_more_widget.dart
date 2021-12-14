import 'package:flutter/material.dart';

class SeeMoreWidget extends StatefulWidget {
  void Function() ontapfun;
  Icon dropicon;
  SeeMoreWidget({Key? key, required this.ontapfun, required this.dropicon})
      : super(key: key);

  @override
  _SeeMoreWidgetState createState() => _SeeMoreWidgetState();
}

class _SeeMoreWidgetState extends State<SeeMoreWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.020,
              right: MediaQuery.of(context).size.width * 0.020),
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.35,
              right: MediaQuery.of(context).size.width * 0.30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(color: Colors.grey, width: 1.0)),
          child: Row(
            children: [
              Text(
                'see more',
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.020),
              widget.dropicon,
            ],
          ),
        ),
        onTap: widget.ontapfun);
  }
}
