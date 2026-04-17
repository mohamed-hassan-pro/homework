import 'package:flutter/material.dart';
import '../models/task_model.dart';

class AddTaskBottomBar extends StatelessWidget {
  AddTaskBottomBar({super.key, required this.tasks, required this.updateTasks});
  final List<TaskModel> tasks;
  TextEditingController taskController = TextEditingController();
  final void Function() updateTasks;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  hintText: 'Add a new task...',
                  filled: true,
                  fillColor: Color(0xffeef4f2),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            CircleAvatar(
              backgroundColor: Color(0xffdee4e2),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.grey[500]),
                //add task and clear text field
                onPressed: () {
                  tasks.add(
                    TaskModel(
                      title: taskController.text,
                      createdAt: DateTime.now(),
                    ),
                  );
                  taskController.clear();
                  updateTasks();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
