import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:spotify_flutter/spotify_flutter.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category{


  const factory Category.artist({
    Artist? guestArtist,
    Artist? hostArtist,
    bool? guestStillChoosing,
}) =
  ArtistCategory;

  const factory Category.genre({
    String? name,
  }) =
  GenreCategory;


  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}