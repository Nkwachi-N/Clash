
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? fcmToken;

  @HiveField(3)
  String? avatar;

  User({
    required this.id,
    required this.name,
    this.avatar,
    this.fcmToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      fcmToken: json['fcm_token'],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'name': name,
      'avatar':avatar,
      'fcm_token':fcmToken,
    };
  }
}
