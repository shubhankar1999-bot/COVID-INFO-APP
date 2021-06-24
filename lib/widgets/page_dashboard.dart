import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  Map data = {};
  Pages({Key key, this.data}): super(key: key);
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(

    );
  }
}
