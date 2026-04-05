import 'package:flutter/material.dart';
import 'package:homeworks/3_bmi_calculator/widgets/custom_widgets.dart';

class WeightAgeSection extends StatelessWidget {
  const WeightAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterCard(title: 'WEIGHT'),
        SizedBox(width: 32),
        CounterCard(title: 'AGE'),
      ],
    );
  }
}

class CounterCard extends StatefulWidget {
  const CounterCard({super.key, required this.title});
  final String title;

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int curentWeight = 60;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomDecorationBox(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(color: Color(0xff6e6f81), fontSize: 16),
              ),
              Text(
                curentWeight.toString(),
                style: const TextStyle(fontSize: 48, fontWeight: .w900),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  IconButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xff4b4e5f),
                      ),
                      iconSize: WidgetStatePropertyAll(35),
                    ),
                    onPressed: () {
                      setState(() {
                        curentWeight--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  SizedBox(width: 12),
                  IconButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xff4b4e5f),
                      ),
                      iconSize: WidgetStatePropertyAll(35),
                    ),
                    alignment: .center,
                    onPressed: () {
                      setState(() {
                        curentWeight++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
