import 'package:basketball_points_counter_app/points_model.dart';
import 'package:flutter/material.dart';

class TeamSection extends StatefulWidget {
  const TeamSection({
    super.key,
    required this.pointsModel,
    required this.teamName,
  });
  final PointsModel pointsModel;
  final String teamName;

  @override
  State<TeamSection> createState() => _TeamSectionState();
}

class _TeamSectionState extends State<TeamSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.pointsModel.checkTeam(widget.teamName),
          style: TextStyle(fontSize: 160, fontWeight: .w500),
        ),
        AddPointsButton(
          label: 'Add 1 Point',
          onTap: () => setState(() {
            widget.pointsModel.addOnePoint(widget.teamName);
          }),
        ),
        SizedBox(height: 12),
        AddPointsButton(
          label: 'Add 2 Point',
          onTap: () => setState(() {
            widget.pointsModel.addTwoPoint(widget.teamName);
          }),
        ),
        SizedBox(height: 12),
        AddPointsButton(
          label: 'Add 3 Point',
          onTap: () => setState(() {
            widget.pointsModel.addhreePoint(widget.teamName);
          }),
        ),
      ],
    );
  }
}

class AddPointsButton extends StatelessWidget {
  const AddPointsButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: .w500),
            ),
          ),
        ),
      ),
    );
  }
}
