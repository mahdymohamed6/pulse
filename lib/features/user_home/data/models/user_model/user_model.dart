import 'user.dart';

class UserModel {
  User? user;

  UserModel({this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
      };
}
