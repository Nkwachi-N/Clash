// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistCategory _$$ArtistCategoryFromJson(Map<String, dynamic> json) =>
    _$ArtistCategory(
      guestArtist: json['guestArtist'] == null
          ? null
          : Artist.fromJson(json['guestArtist'] as Map<String, dynamic>),
      hostArtist: json['hostArtist'] == null
          ? null
          : Artist.fromJson(json['hostArtist'] as Map<String, dynamic>),
      guestStillChoosing: json['guestStillChoosing'] as bool?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ArtistCategoryToJson(_$ArtistCategory instance) =>
    <String, dynamic>{
      'guestArtist': instance.guestArtist,
      'hostArtist': instance.hostArtist,
      'guestStillChoosing': instance.guestStillChoosing,
      'runtimeType': instance.$type,
    };

_$GenreCategory _$$GenreCategoryFromJson(Map<String, dynamic> json) =>
    _$GenreCategory(
      name: json['name'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenreCategoryToJson(_$GenreCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'runtimeType': instance.$type,
    };
