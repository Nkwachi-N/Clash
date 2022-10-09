// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'artist':
      return ArtistCategory.fromJson(json);
    case 'genre':
      return GenreCategory.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Category',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Category {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)
        artist,
    required TResult Function(String? name) genre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)?
        artist,
    TResult Function(String? name)? genre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)?
        artist,
    TResult Function(String? name)? genre,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistCategory value) artist,
    required TResult Function(GenreCategory value) genre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ArtistCategory value)? artist,
    TResult Function(GenreCategory value)? genre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistCategory value)? artist,
    TResult Function(GenreCategory value)? genre,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;
}

/// @nodoc
abstract class _$$ArtistCategoryCopyWith<$Res> {
  factory _$$ArtistCategoryCopyWith(
          _$ArtistCategory value, $Res Function(_$ArtistCategory) then) =
      __$$ArtistCategoryCopyWithImpl<$Res>;
  $Res call(
      {Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing});

  $ArtistCopyWith<$Res>? get guestArtist;
  $ArtistCopyWith<$Res>? get hostArtist;
}

/// @nodoc
class __$$ArtistCategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$$ArtistCategoryCopyWith<$Res> {
  __$$ArtistCategoryCopyWithImpl(
      _$ArtistCategory _value, $Res Function(_$ArtistCategory) _then)
      : super(_value, (v) => _then(v as _$ArtistCategory));

  @override
  _$ArtistCategory get _value => super._value as _$ArtistCategory;

  @override
  $Res call({
    Object? guestArtist = freezed,
    Object? hostArtist = freezed,
    Object? guestStillChoosing = freezed,
  }) {
    return _then(_$ArtistCategory(
      guestArtist: guestArtist == freezed
          ? _value.guestArtist
          : guestArtist // ignore: cast_nullable_to_non_nullable
              as Artist?,
      hostArtist: hostArtist == freezed
          ? _value.hostArtist
          : hostArtist // ignore: cast_nullable_to_non_nullable
              as Artist?,
      guestStillChoosing: guestStillChoosing == freezed
          ? _value.guestStillChoosing
          : guestStillChoosing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $ArtistCopyWith<$Res>? get guestArtist {
    if (_value.guestArtist == null) {
      return null;
    }

    return $ArtistCopyWith<$Res>(_value.guestArtist!, (value) {
      return _then(_value.copyWith(guestArtist: value));
    });
  }

  @override
  $ArtistCopyWith<$Res>? get hostArtist {
    if (_value.hostArtist == null) {
      return null;
    }

    return $ArtistCopyWith<$Res>(_value.hostArtist!, (value) {
      return _then(_value.copyWith(hostArtist: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistCategory implements ArtistCategory {
  const _$ArtistCategory(
      {this.guestArtist,
      this.hostArtist,
      this.guestStillChoosing,
      final String? $type})
      : $type = $type ?? 'artist';

  factory _$ArtistCategory.fromJson(Map<String, dynamic> json) =>
      _$$ArtistCategoryFromJson(json);

  @override
  final Artist? guestArtist;
  @override
  final Artist? hostArtist;
  @override
  final bool? guestStillChoosing;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Category.artist(guestArtist: $guestArtist, hostArtist: $hostArtist, guestStillChoosing: $guestStillChoosing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistCategory &&
            const DeepCollectionEquality()
                .equals(other.guestArtist, guestArtist) &&
            const DeepCollectionEquality()
                .equals(other.hostArtist, hostArtist) &&
            const DeepCollectionEquality()
                .equals(other.guestStillChoosing, guestStillChoosing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(guestArtist),
      const DeepCollectionEquality().hash(hostArtist),
      const DeepCollectionEquality().hash(guestStillChoosing));

  @JsonKey(ignore: true)
  @override
  _$$ArtistCategoryCopyWith<_$ArtistCategory> get copyWith =>
      __$$ArtistCategoryCopyWithImpl<_$ArtistCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)
        artist,
    required TResult Function(String? name) genre,
  }) {
    return artist(guestArtist, hostArtist, guestStillChoosing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)?
        artist,
    TResult Function(String? name)? genre,
  }) {
    return artist?.call(guestArtist, hostArtist, guestStillChoosing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)?
        artist,
    TResult Function(String? name)? genre,
    required TResult orElse(),
  }) {
    if (artist != null) {
      return artist(guestArtist, hostArtist, guestStillChoosing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistCategory value) artist,
    required TResult Function(GenreCategory value) genre,
  }) {
    return artist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ArtistCategory value)? artist,
    TResult Function(GenreCategory value)? genre,
  }) {
    return artist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistCategory value)? artist,
    TResult Function(GenreCategory value)? genre,
    required TResult orElse(),
  }) {
    if (artist != null) {
      return artist(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistCategoryToJson(
      this,
    );
  }
}

abstract class ArtistCategory implements Category {
  const factory ArtistCategory(
      {final Artist? guestArtist,
      final Artist? hostArtist,
      final bool? guestStillChoosing}) = _$ArtistCategory;

  factory ArtistCategory.fromJson(Map<String, dynamic> json) =
      _$ArtistCategory.fromJson;

  Artist? get guestArtist;
  Artist? get hostArtist;
  bool? get guestStillChoosing;
  @JsonKey(ignore: true)
  _$$ArtistCategoryCopyWith<_$ArtistCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenreCategoryCopyWith<$Res> {
  factory _$$GenreCategoryCopyWith(
          _$GenreCategory value, $Res Function(_$GenreCategory) then) =
      __$$GenreCategoryCopyWithImpl<$Res>;
  $Res call({String? name});
}

/// @nodoc
class __$$GenreCategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$$GenreCategoryCopyWith<$Res> {
  __$$GenreCategoryCopyWithImpl(
      _$GenreCategory _value, $Res Function(_$GenreCategory) _then)
      : super(_value, (v) => _then(v as _$GenreCategory));

  @override
  _$GenreCategory get _value => super._value as _$GenreCategory;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$GenreCategory(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreCategory implements GenreCategory {
  const _$GenreCategory({this.name, final String? $type})
      : $type = $type ?? 'genre';

  factory _$GenreCategory.fromJson(Map<String, dynamic> json) =>
      _$$GenreCategoryFromJson(json);

  @override
  final String? name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Category.genre(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreCategory &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$GenreCategoryCopyWith<_$GenreCategory> get copyWith =>
      __$$GenreCategoryCopyWithImpl<_$GenreCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)
        artist,
    required TResult Function(String? name) genre,
  }) {
    return genre(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)?
        artist,
    TResult Function(String? name)? genre,
  }) {
    return genre?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Artist? guestArtist, Artist? hostArtist, bool? guestStillChoosing)?
        artist,
    TResult Function(String? name)? genre,
    required TResult orElse(),
  }) {
    if (genre != null) {
      return genre(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistCategory value) artist,
    required TResult Function(GenreCategory value) genre,
  }) {
    return genre(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ArtistCategory value)? artist,
    TResult Function(GenreCategory value)? genre,
  }) {
    return genre?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistCategory value)? artist,
    TResult Function(GenreCategory value)? genre,
    required TResult orElse(),
  }) {
    if (genre != null) {
      return genre(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreCategoryToJson(
      this,
    );
  }
}

abstract class GenreCategory implements Category {
  const factory GenreCategory({final String? name}) = _$GenreCategory;

  factory GenreCategory.fromJson(Map<String, dynamic> json) =
      _$GenreCategory.fromJson;

  String? get name;
  @JsonKey(ignore: true)
  _$$GenreCategoryCopyWith<_$GenreCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
