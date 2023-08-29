import 'dart:convert';

import 'package:clash_flutter/src/core/models/turn.dart';
import 'package:clash_flutter/src/core/models/user.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'category/category.dart';

class Game {
  Category? category;
  String id;
  int? rounds;
  User? host;
  User? guest;
  Turn? turn;
  int hostPoints;
  int guestPoints;
  Track? hostPlayed;
  Track? guestPlayed;

  Game({
    this.category,
    required this.id,
    this.rounds,
    this.guest,
    this.host,
    this.turn,
    this.guestPoints = 0,
    this.hostPoints = 0,
    this.hostPlayed,
    this.guestPlayed,
  });

  factory Game.fromFirestore(Map<String, dynamic> json) {
    return Game(
      category: Category.fromJson(json['category']),
      rounds: json['rounds'],
      host: User.fromFirebaseData(json['host']),
      guest: User.fromFirebaseData(json['guest']),
      id: json['id'],
      hostPoints: json['hostPoints'],
      guestPoints: json['guestPoints'],
      hostPlayed: json['hostPlayed'] != null ? Track.fromJson(jsonDecode(json['hostPlayed'])) : null,
      guestPlayed: json['guestPlayed'] != null ? Track.fromJson(jsonDecode(json['guestPlayed'])) : null,
      turn: json['turn'] == Turn.host.name ? Turn.host : Turn.guest,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (category != null) "category": category?.toJson(),
      if (rounds != null) "rounds": rounds,
      if (host != null) "host": host!.toFirebaseMap(),
      if (guest != null) "guest": guest!.toFirebaseMap(),
      if (turn != null) 'turn': turn!.name,
      if(guestPlayed != null) 'guestPlayed': jsonEncode(guestPlayed?.toJson()),
      if(hostPlayed != null) 'hostPlayed': jsonEncode(hostPlayed?.toJson()),
      'guestPoints': guestPoints,
      'hostPoints': hostPoints,
      'id': id
    };
  }

  Game copyWith({
    Category? category,
    String? id,
    int? rounds,
    User? guest,
    User? host,
    Turn? turn,
    int? guestPoints,
    int? hostPoints,
    Track? hostPlayed,
    Track? guestPlayed,
  }) {
    return Game(
      id: id ?? this.id,
      turn: turn ?? this.turn,
      category: category ?? this.category,
      guest: guest ?? this.guest,
      guestPlayed: guestPlayed ?? this.guestPlayed,
      guestPoints: guestPoints ?? this.guestPoints,
      host: host ?? this.host,
      hostPlayed: hostPlayed ?? this.hostPlayed,
      hostPoints: hostPoints ?? this.hostPoints,
      rounds: rounds ?? this.rounds,
    );
  }
}
