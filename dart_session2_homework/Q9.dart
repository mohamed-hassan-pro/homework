/*
Exercise 9:
9. a) Create List> students with two items, each having name and grade.
b) Print the grade of the second student using index and key.
c) Add both grades and print the average grade as double.
*/
void main() {
  // Map<String, dynamic> student1 = {'name': 'Mohamed', 'grade': 3.44};
  // Map<String, dynamic> student2 = {'name': 'Hassan', 'grade': 3.36};
  // List<Map<String, String>> students = [student1, student2];
  // best in case (use items in other places)

  //another way to create tow items (best less code)
  List<Map<String, dynamic>> students = [
    {'name': 'Mohamed', 'grade': 3.44},
    {'name': 'Hassan', 'grade': 3.28},
  ];

  print('Grade of the second student: ${students[1]['grade']}');

  double sumGrade = students[0]['grade'] + students[1]['grade'];
  print('Average grade: ${sumGrade / students.length}');
}
