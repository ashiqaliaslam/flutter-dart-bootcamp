// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
    required this.addTaskCallback,
  });

  final Function addTaskCallback;

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      // color: Color(0xff757575),
      // color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
            ),
            onPressed: () {
              addTaskCallback(newTaskTitle);
              // log(newTaskTitle.toString());
            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
