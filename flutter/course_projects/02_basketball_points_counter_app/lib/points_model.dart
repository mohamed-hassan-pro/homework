class PointsModel {
  PointsModel({required this.teamAPoints, required this.teamBPoints});
  int teamAPoints;
  int teamBPoints;

  String checkTeam(String team) {
    if (team == 'A') {
      return teamAPoints.toString();
    } else {
      return teamBPoints.toString();
    }
  }

  void addOnePoint(String team) {
    if (team == 'A') {
      teamAPoints++;
    } else {
      teamBPoints++;
    }
  }

  void addTwoPoint(String team) {
    if (team == 'A') {
      teamAPoints += 2;
    } else {
      teamBPoints += 2;
    }
  }

  void addhreePoint(String team) {
    if (team == 'A') {
      teamAPoints += 3;
    } else {
      teamBPoints += 3;
    }
  }

  void resetPoint() {
    teamAPoints = 0;
    teamBPoints = 0;
  }
}
