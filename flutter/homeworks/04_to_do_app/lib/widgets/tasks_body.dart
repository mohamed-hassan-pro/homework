import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_item.dart';
import '../models/task_model.dart';

class TasksBody extends StatefulWidget {
  TasksBody({super.key, required this.tasks, required this.updateTasks});
  List<TaskModel> tasks;
  final void Function() updateTasks;

  @override
  State<TasksBody> createState() => _TasksBodyState();
}

class _TasksBodyState extends State<TasksBody> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xfff5fbf9),
      child: ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(
            task: widget.tasks[index],
            onDelete: () {
              widget.tasks.remove(widget.tasks[index]);
              widget.tasks.isEmpty ? widget.updateTasks() : setState(() {});
            },
          );
        },
      ),
    );
  }
}