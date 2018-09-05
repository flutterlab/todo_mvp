import 'package:flutter/material.dart';
import 'package:todo_mvp/data/data_manager.dart';
import 'package:todo_mvp/model/todo.dart';
class CreatePage extends StatefulWidget{
  final String title = "Add New Todo";
  @override
  CreatePageState createState() => new CreatePageState();

}

class CreatePageState extends State<CreatePage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Todo todo = new Todo("", "");

  String _validate(String value) {
    if (value.length < 1) {
      return 'Plase enter value';
    }

    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the login data.');
      print('Email: ${todo.title}');
      print('Password: ${todo.desc}');
      DataManager().addItem(todo);
      Navigator.pop(context, {'Add': todo});
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;


    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    keyboardType: TextInputType.text, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'Enter Title',
                        labelText: 'Title'
                    ),
                  validator: this._validate,
                    onSaved: (String value) {
                      this.todo.title = value;
                    }

                ),
                new TextFormField(
                    keyboardType: TextInputType.text, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Enter Desc',
                        labelText: 'Desc'
                    ),
                  validator: this._validate,
                    onSaved: (String value) {
                      this.todo.desc = value;
                    }
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Add',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: this.submit,
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}