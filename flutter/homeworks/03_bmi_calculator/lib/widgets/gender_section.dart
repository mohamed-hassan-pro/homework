import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/widgets/custom_widgets.dart';


class GenderSection extends StatefulWidget {
  const GenderSection({super.key, required this.bmiModel});
  final BMIModel bmiModel;
  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  final Color _selectedColor = Color(0xff17172f);
  final Color _unSelectedColor = Color(0xff090b24);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GenderSelectionCard(
            color: widget.bmiModel.gender==Gender.male
                ? _selectedColor
                : _unSelectedColor,
            icon: Icons.male,
            data: 'MALE',
            onTap: () => setState(() {
              widget.bmiModel.gender = Gender.male;
            }),
          ),
        ),
        SizedBox(width: 32),
        Expanded(
          child: GenderSelectionCard(
            color: widget.bmiModel.gender == Gender.female
                ? _selectedColor
                : _unSelectedColor,
            icon: Icons.female,
            data: 'FEMALE',
            onTap: () => setState(() {
              widget.bmiModel.gender = Gender.female;
            }),
          ),
        ),
      ],
    );
  }
}

class GenderSelectionCard extends StatelessWidget {
  const GenderSelectionCard({
    super.key,
    required this.icon,
    required this.data,
    this.onTap,
    required this.color,
  });
  final IconData icon;
  final String data;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomDecorationBox(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(icon, size: 80),
              Text(data, style: TextStyle(color: Color(0xff6e6f81))),
            ],
          ),
        ),
      ),
    );
  }
}
