import 'package:investify/features/user_home/data/entities/user_entity.dart';

class User extends UserEntity {
  String? id;
  String? username;
  String? email;
  String? password;
  String? role;
  String? phone;
  int? coins;
  List<dynamic>? projects;
  List<dynamic>? likes;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.role,
    this.phone,
    this.coins,
    this.projects,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.v,
  }) : super(userName: username, email: email, phone: phone, coins: coins);

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        role: json['role'] as String?,
        phone: json['phone'] as String?,
        coins: json['coins'] as int?,
        projects: json['projects'] as List<dynamic>?,
        likes: json['likes'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'email': email,
        'password': password,
        'role': role,
        'phone': phone,
        'coins': coins,
        'projects': projects,
        'likes': likes,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
