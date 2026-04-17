
import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskItem extends StatefulWidget {
  TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
  });
  final TaskModel task;
  final void Function() onDelete;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      subtitle: Text(widget.task.createdAt.toString()),
      leading: Checkbox(
        value: widget.task.isDone,
        onChanged: (value) {
          setState(() {
            widget.task.isDone = value!;
          });
        },
      ),
      trailing: IconButton(
        onPressed: widget.onDelete,
        icon: Icon(Icons.delete),
      ),
    );
  }
}
