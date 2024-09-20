import 'package:famplay/domain/model/prize/prize_fields.dart';

class PrizeModel {
  final int id;
  final String description;
  final int cost;

  PrizeModel({
    required this.id,
    required this.description,
    required this.cost,
  });

  factory PrizeModel.fromJson(Map<String, dynamic> json) => PrizeModel(
        id: json['id'],
        description: json['description'],
        cost: json['cost'],
      );

  Map<String, Object?> toJson() => {
        PrizeFields.id: id,
        PrizeFields.description: description,
        PrizeFields.cost: cost,
      };

  PrizeModel copy({
    int? id,
    String? description,
    int? cost,
  }) =>
      PrizeModel(
        id: id ?? this.id,
        description: description ?? this.description,
        cost: cost ?? this.cost,
      );
}

List<PrizeModel> fromJsonList(List<dynamic> jsonList) {
  return jsonList.map((json) => PrizeModel.fromJson(json)).toList();
}
