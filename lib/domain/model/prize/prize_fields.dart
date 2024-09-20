class PrizeFields {
  static const String userTable = 'prizes';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = 'id';
  static const String description = 'description';
  static const String cost = 'cost';
 
  static const List<String> values = [
    id,
    description,
    cost,
  ];
}
