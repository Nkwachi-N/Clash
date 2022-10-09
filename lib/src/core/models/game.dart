import 'package:clash_flutter/src/core/models/user.dart';

import 'category/category.dart';

class Game {
  Category? category;
  String id;
  int? rounds;
  User? host;
  User? guest;

  Game({this.category, required this.id,this.rounds, this.guest, this.host});


  factory Game.fromFirestore(Map<String,dynamic> json) {
    return Game(
      category: Category.fromJson(json['category']),
      rounds: json['rounds'],
      host: User.fromFirebaseData(json['host']),
      guest: User.fromFirebaseData(json['guest']), id: json['id'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (category != null) "category": category?.toJson(),
      if (rounds != null) "rounds": rounds,
      if (host != null) "host": host!.toFirebaseMap(),
      if (guest != null) "guest": guest!.toFirebaseMap(),
      'id': id
    };
  }
}


