/*
Q3
Create a class Grade with a private field _score.
- The setter should only accept values 0–100, otherwise print 'Invalid score'.
- Add a getter and a computed getter isPass that returns true if score ≥ 50.
- In main(), demonstrate updating the score multiple times and printing results.
*/
void main() {
  Grade grade = Grade();

  grade.score = 98;
  print('Grade: ${grade.score}\nPassed: ${grade.isPass}');
  
  grade.score = 40;
  print('Grade: ${grade.score}\nPassed: ${grade.isPass}');
}

class Grade {
  num? _score;

  set score(num score) {
    if (score >= 0 && score <= 100) {
      this._score = score;
    }
  }

  num? get score => this._score;

  bool get isPass => this._score! >= 50;
}
