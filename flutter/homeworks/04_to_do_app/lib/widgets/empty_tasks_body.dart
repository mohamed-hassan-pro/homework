import 'package:flutter/material.dart';

class EmptyTasksBody extends StatelessWidget {
  const EmptyTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xfff5fbf9),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Color(0xffa9cfc8),
            ),
            Text(
              'No tasks yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w500,
                color: Colors.black54,
              ),
            ),
            Text(
              'Add a task to get started',
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w500,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
