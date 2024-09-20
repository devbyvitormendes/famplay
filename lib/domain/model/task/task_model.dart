import 'package:famplay/domain/model/task/task_fields.dart';

class TaskModel {
  final int id;
  final String description;
  final int points;
  bool weekdays;
  bool weekends;

  TaskModel({
    required this.id,
    required this.description,
    required this.points,
    required this.weekdays,
    required this.weekends,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        description: json['description'],
        points: json['points'],
        weekdays: json['weekdays'],
        weekends: json['weekends'],
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.description: description,
        TaskFields.points: points,
        TaskFields.weekdays: weekdays,
        TaskFields.weekends: weekends,
      };

  TaskModel copy({
    int? id,
    String? description,
    int? points,
    bool? weekdays,
    bool? weekends,
  }) =>
      TaskModel(
        id: id ?? this.id,
        description: description ?? this.description,
        points: points ?? this.points,
        weekdays: weekdays ?? this.weekdays,
        weekends: weekends ?? this.weekends,
      );
}

List<TaskModel> fromJsonList(List<dynamic> jsonList) {
  return jsonList.map((json) => TaskModel.fromJson(json)).toList();
}
