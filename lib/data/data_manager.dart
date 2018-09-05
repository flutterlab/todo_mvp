import 'package:todo_mvp/model/todo.dart';

class DataManager{
  static final DataManager _singleton = new DataManager._internal();

  List<Todo> list = new List();

  factory DataManager() {
    return _singleton;
  }

  DataManager._internal();


  void addItem(Todo todo){
    list.add(todo);
  }

  void updateItem(){

  }

  List<Todo> getAll(){
    return list;
  }

}