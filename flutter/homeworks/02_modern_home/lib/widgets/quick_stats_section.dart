import 'package:flutter/material.dart';

class QuickStatsSection extends StatelessWidget {
  const QuickStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Quick Stats',
          style: TextStyle(
            fontSize: 22,
            fontWeight: .w800,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: .spaceAround,
          children: [
            StatCardItem(
              icon: Icons.people,
              iconColor: Color(0xff6037B5),
              data: '1,234',
              label: 'Users',
            ),
            StatCardItem(
              icon: Icons.star,
              iconColor: Color(0xffFA9502),
              data: '4.8',
              label: 'Rating',
            ),
            StatCardItem(
              icon: Icons.trending_up,
              iconColor: Color(0xff3D87B1),
              data: '98%',
              label: 'Success',
            ),
          ],
        ),
      ],
    );
  }
}

class StatCardItem extends StatelessWidget {
  final IconData icon;
  final String data;
  final String label;
  final Color iconColor;

  const StatCardItem({
    required this.data,
    required this.label,
    required this.icon,
    required this.iconColor,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 28),
              SizedBox(height: 6),
              Text(
                data,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: .bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
