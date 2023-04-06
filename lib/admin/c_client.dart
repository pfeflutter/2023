import 'package:flutter/material.dart';

import '../cllient/mon_compte.dart';

class TaskTitle extends StatelessWidget {
  final String taskTitle;
  const TaskTitle({required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        ),
        onTap: () {
          Navigator.push(
            context,
              MaterialPageRoute(
                builder: (context) => const MonCompteCl(),
              ),
          );
        },
    );
  }
}

class Task {
  final String name;

  Task({required this.name});
}