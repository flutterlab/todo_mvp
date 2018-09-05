import 'package:flutter/material.dart';
import 'package:todo_mvp/list/list_card.dart';
import 'package:todo_mvp/model/todo.dart';
import 'package:todo_mvp/util/alert_util.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  TodoList(this.todos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
  ListView _buildList(context) {
    return new ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: todos.length,
      // A callback that will return a widget.
      itemBuilder: (context, index) {
        final Todo item = todos[index];
        return Dismissible(
            key: new Key(item.title),
            direction: DismissDirection.endToStart,
            // We also need to provide a function that tells our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from our data source.
//            this.setState(() {
             todos.removeAt(index);
//            });
          AlertUtil.showSnackBar(context, item.title+" Deleted...");
              // Then show a snackbar!

            },
            // Show a red background as the item is swiped away
            background: Container(color: Colors.red),
            child: new TodoCard(todos[index],
            )
//        return new TodoCard(todos[index]);
        );
      }
    );
  }
}