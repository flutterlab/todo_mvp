import 'package:flutter/material.dart';
import 'package:todo_mvp/data/data_manager.dart';
import 'package:todo_mvp/list/todo_list.dart';
import 'package:todo_mvp/model/todo.dart';
class ListPage extends StatefulWidget{
  final String title = "ToDo List";

  @override
  ListPageState createState() => new ListPageState();

}


class ListPageState extends State<ListPage> {

  var initialTodos = <Todo>[]
    ..add(new Todo('Monu', 'Lets call'))
  ..add(new Todo("siva", "tes"));


  void navigate(){
    Navigator.of(context,).pushNamed("/add");
  }

  @override
  void initState() {
    super.initState();
    print("initState called....");
    setState(() {
      this.initialTodos = DataManager().getAll();
    });
  }
  @override
  void setState(fn) {
    super.setState(fn);
    print("setState called....");

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Container(
        // Remove the DogCard Widget.
        // Instead, use your new Dog List Class,
        // Pass in the mock data from the list above
        //
        child: new Center(                                              // new
          child: new TodoList(initialTodos),                                     // new
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: navigate,
        tooltip: 'New',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
