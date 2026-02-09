/*
Q5 Create a class Course with attributes title and duration (default = 3 months). Create two
courses: one with custom duration and one with the default. Print both.
*/
void main() {
  Course c1 = Course('Math', 6);
  Course c2 = Course('Science');

  print('${c1.title} ${c1.duration}');
  print('${c2.title} ${c2.duration}');
}

class Course {
  String title;
  int duration;

  Course(this.title, [this.duration = 3]);
}