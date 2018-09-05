import 'package:flutter/material.dart';
import 'package:todo_mvp/add/create_page.dart';
import 'package:todo_mvp/detail/details_page.dart';
import 'package:todo_mvp/list/list_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ' TODO',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListPage(),
      routes: <String, WidgetBuilder> {
        "/list":(BuildContext context) => new ListPage(),
        "/add": (BuildContext context) => new CreatePage(),
        "/details": (BuildContext context) => new DetailsPage(null)
      },
    );
  }
}
