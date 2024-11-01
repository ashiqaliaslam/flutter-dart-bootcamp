import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    this.isChecked = false,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPresCallback,
  });

  final bool isChecked;
  final String? taskTitle;
  final ValueChanged checkboxCallback;
  final GestureLongPressCallback longPresCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPresCallback,
      title: Text(
        taskTitle ?? '',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
