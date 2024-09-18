import 'package:famplay/domain/model/userModel/profile.dart';
import 'package:famplay/domain/model/userModel/user_fields.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String image;
  final Profile profile;
  int? parentId;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.profile,
    this.parentId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        image: json['image'],
        profile: Profile.values
            .firstWhere((element) => element.name == json['profile']),
        parentId: json['parentId'],
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.password: password,
        UserFields.image: image,
        UserFields.profile: profile.name,
        UserFields.parentId: parentId,
      };

  UserModel copy({
    int? id,
    String? name,
    String? email,
    String? password,
    String? image,
    Profile? profile,
    int? parentId,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image ?? this.image,
        profile: profile ?? this.profile,
        parentId: parentId ?? this.parentId,
      );

  UserModel setParentProfile() => copy(profile: Profile.parent);

  UserModel setChildProfile(int parentId) => copy(
        profile: Profile.child,
        parentId: parentId,
      );
}

List<UserModel> fromJsonList(List<dynamic> jsonList) {
  return jsonList.map((json) => UserModel.fromJson(json)).toList();
}
