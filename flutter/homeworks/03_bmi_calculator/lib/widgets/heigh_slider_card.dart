import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart'
    show BMIModel;
import 'package:bmi_calculator/widgets/custom_widgets.dart';

class HeightSliderCard extends StatefulWidget {
  const HeightSliderCard({super.key, required this.bmiModel});
  final BMIModel bmiModel;

  @override
  State<HeightSliderCard> createState() => _HeightSliderCardState();
}

class _HeightSliderCardState extends State<HeightSliderCard> {

  @override
  Widget build(BuildContext context) {
    return CustomDecorationBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'HEIGHT',
              style: TextStyle(color: Color(0xff6e6f81), fontSize: 16),
            ),
            Row(
              mainAxisAlignment: .center,
              crossAxisAlignment: .baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  widget.bmiModel.height.round().toString(),
                  style: TextStyle(fontSize: 48, fontWeight: .w900),
                ),
                Text('cm', style: TextStyle(color: Color(0xff6e6f81))),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                thumbColor: Color(0xffeb0e53),
                inactiveTrackColor: Color(0xff8e909d),
                activeTrackColor: Colors.white,
                trackHeight: 0.5,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
              ),
              child: Slider(
                min: 20,
                max: 270,
                value: widget.bmiModel.height,
                onChanged: (double value) => setState(() {
                  widget.bmiModel.height = value;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
