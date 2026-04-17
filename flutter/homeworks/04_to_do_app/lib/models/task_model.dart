class TaskModel {
  final String title;
  final DateTime createdAt;
  bool isDone;

  TaskModel({
    required this.title,
    required this.createdAt,
    this.isDone = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskModel &&
        other.title == title &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => title.hashCode ^ createdAt.hashCode;
}
