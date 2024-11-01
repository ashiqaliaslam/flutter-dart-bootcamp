// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    this.isChecked = false,
    required this.taskTitle,
    required this.checkboxCallback,
  });

  final bool isChecked;
  final String? taskTitle;
  final Function checkboxCallback;

  // void toggleCheckdState

  // (bool? checkboxState) {
  //   setState(() {
  //     isChecked = checkboxState ?? false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle ?? '',
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (value) {
            checkboxCallback(value);
          },
          // onChanged: toggleCheckdState,
        ));
  }
}

// class TaskCheckbox extends StatelessWidget {
//   const TaskCheckbox({
//     super.key,
//     required this.checkboxState,
//     required this.checkboxCallback,
//   });

//   final bool checkboxState;
//   final void Function(bool?) checkboxCallback;

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkboxState,
//       onChanged: checkboxCallback,
//     );
//   }
// }
