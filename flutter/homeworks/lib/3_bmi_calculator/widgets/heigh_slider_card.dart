import 'package:flutter/material.dart';
import 'package:homeworks/3_bmi_calculator/widgets/custom_widgets.dart';

class HeightSliderCard extends StatefulWidget {
  const HeightSliderCard({super.key});

  @override
  State<HeightSliderCard> createState() => _HeightSliderCardState();
}

class _HeightSliderCardState extends State<HeightSliderCard> {
  double _currentSliderValue = 170;

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
                  _currentSliderValue.round().toString(),
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
                value: _currentSliderValue,
                onChanged: (double value) => setState(() {
                  _currentSliderValue = value;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
