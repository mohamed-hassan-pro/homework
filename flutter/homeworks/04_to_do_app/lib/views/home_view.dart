import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/tasks_body.dart';
import '../widgets/add_task_bottom_bar.dart';
import '../widgets/empty_tasks_body.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  final List<TaskModel> tasks = [];
  void updateTasks() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: TextStyle(fontSize: 26, fontWeight: .w500),
        ),
        backgroundColor: Color(0xff9ef2e3),
      ),
      body: tasks.isEmpty
          ? const EmptyTasksBody()
          : TasksBody(tasks: tasks, updateTasks: updateTasks),
      bottomNavigationBar: AddTaskBottomBar(
        tasks: tasks,
        updateTasks: updateTasks,
      ),
    );
  }
}
