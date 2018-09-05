import 'package:flutter/material.dart';
import 'package:todo_mvp/model/todo.dart';
class DetailsPage extends StatefulWidget{
 final String title = "Details";
 final Todo todo;

 DetailsPage(this.todo);

 @override
  DetailsPageState createState() => new DetailsPageState();

}


class DetailsPageState extends State<DetailsPage> {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.todo.title),
      ),
      body: new Center(
        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              widget.todo.desc
            ),
          ],
        ),
      ),
    );
  }
}