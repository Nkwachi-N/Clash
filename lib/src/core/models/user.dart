import 'package:hive_flutter/hive_flutter.dart';
import 'package:spotify_flutter/spotify_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? avatar;

  String? deviceToken;

  User({
    required this.id,
    required this.name,
    this.avatar,
    this.deviceToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['display_name'],
        avatar: _getImages(json),
        deviceToken: json['device_token']);
  }

  factory User.fromFirebaseData(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        avatar: json['avatar'],
        deviceToken: json['device_token']);
  }

  static String _getImages(Map<String, dynamic> json) {
    List<Image>? images = json['images'];
    return images != null && images.isNotEmpty ? images[0].url ?? '' : '';
  }

  Map<String, dynamic> toFirebaseMap() {
    return {
      'id': id,
      'name': name.toLowerCase(),
      'avatar': avatar,
      'device_token': deviceToken,
    };
  }
}
