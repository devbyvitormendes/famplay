class TaskFields {
  static const String userTable = 'tasks';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = 'id';
  static const String description = 'description';
  static const String points = 'points';
  static const String weekdays = 'weekdays';
  static const String weekends = 'weekends';
  static const String done = 'done';
 
  static const List<String> values = [
    id,
    description,
    points,
    weekdays,
    weekends,
    done,
  ];
}
