import 'package:basketball_points_counter_app/points_model.dart';
import 'package:basketball_points_counter_app/team_section.dart';
import 'package:flutter/material.dart';

class BasketballPointsCounterScreen extends StatefulWidget {
  BasketballPointsCounterScreen({super.key});
  final PointsModel pointsModel = PointsModel(teamAPoints: 0, teamBPoints: 0);

  @override
  State<BasketballPointsCounterScreen> createState() =>
      _BasketballPointsCounterScreenState();
}

class _BasketballPointsCounterScreenState
    extends State<BasketballPointsCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Points Counter"),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Team A', style: TextStyle(fontSize: 32)),
                      TeamSection(
                        pointsModel: widget.pointsModel,
                        teamName: 'A',
                      ),
                    ],
                  ),
                  VerticalDivider(color: Colors.black, thickness: 5),
                  Column(
                    children: [
                      Text('Team B', style: TextStyle(fontSize: 32)),
                      TeamSection(
                        pointsModel: widget.pointsModel,
                        teamName: 'B',
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: 160,
                child: AddPointsButton(
                  label: 'Reset',
                  onTap: () => setState(() {
                    widget.pointsModel.resetPoint();
                  }),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
