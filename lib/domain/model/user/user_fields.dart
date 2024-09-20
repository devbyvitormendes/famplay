class UserFields {
  static const String userTable = 'users';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String image = 'image';
  static const String profile = 'profile';
  static const String parentId = 'parentId';

  static const List<String> values = [
    id,
    name,
    email,
    password,
    image,
    profile,
    parentId,
  ];
}
