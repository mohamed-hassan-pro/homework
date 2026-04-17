import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/tasks_body.dart';
import '../widgets/add_task_bottom_bar.dart';
import '../widgets/empty_tasks_body.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
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
