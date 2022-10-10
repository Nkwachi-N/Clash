/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Miroodles Color Comp.png
  AssetGenImage get miroodlesColorComp =>
      const AssetGenImage('assets/images/Miroodles Color Comp.png');

  /// File path: assets/images/Spotify_Icon_White.png
  AssetGenImage get spotifyIconWhite =>
      const AssetGenImage('assets/images/Spotify_Icon_White.png');

  /// File path: assets/images/X42.png
  AssetGenImage get x42 => const AssetGenImage('assets/images/X42.png');

  /// File path: assets/images/about_clash.svg
  String get aboutClash => 'assets/images/about_clash.svg';

  /// File path: assets/images/avatar_1.png
  AssetGenImage get avatar1 =>
      const AssetGenImage('assets/images/avatar_1.png');

  /// File path: assets/images/avatar_2.png
  AssetGenImage get avatar2 =>
      const AssetGenImage('assets/images/avatar_2.png');

  /// File path: assets/images/avatar_3.png
  AssetGenImage get avatar3 =>
      const AssetGenImage('assets/images/avatar_3.png');

  /// File path: assets/images/category.svg
  String get category => 'assets/images/category.svg';

  /// File path: assets/images/crown.svg
  String get crown => 'assets/images/crown.svg';

  /// File path: assets/images/exclamation.png
  AssetGenImage get exclamation =>
      const AssetGenImage('assets/images/exclamation.png');

  /// File path: assets/images/fighting-game.svg
  String get fightingGame => 'assets/images/fighting-game.svg';

  /// File path: assets/images/flame.svg
  String get flame => 'assets/images/flame.svg';

  /// File path: assets/images/home.svg
  String get home => 'assets/images/home.svg';

  /// File path: assets/images/icon_back_arrow.svg
  String get iconBackArrow => 'assets/images/icon_back_arrow.svg';

  /// File path: assets/images/invite_friends.svg
  String get inviteFriends => 'assets/images/invite_friends.svg';

  /// File path: assets/images/invite_sent.png
  AssetGenImage get inviteSent =>
      const AssetGenImage('assets/images/invite_sent.png');

  /// File path: assets/images/music.svg
  String get music => 'assets/images/music.svg';

  /// File path: assets/images/my_avatar.svg
  String get myAvatar => 'assets/images/my_avatar.svg';

  /// File path: assets/images/profile-frame.svg
  String get profileFrame => 'assets/images/profile-frame.svg';

  /// File path: assets/images/profile.svg
  String get profile => 'assets/images/profile.svg';

  /// File path: assets/images/rate_us.svg
  String get rateUs => 'assets/images/rate_us.svg';

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/share_socials.svg
  String get shareSocials => 'assets/images/share_socials.svg';

  /// File path: assets/images/success.png
  AssetGenImage get success => const AssetGenImage('assets/images/success.png');

  /// File path: assets/images/warning.png
  AssetGenImage get warning => const AssetGenImage('assets/images/warning.png');

  /// List of all assets
  List<dynamic> get values => [
        miroodlesColorComp,
        spotifyIconWhite,
        x42,
        aboutClash,
        avatar1,
        avatar2,
        avatar3,
        category,
        crown,
        exclamation,
        fightingGame,
        flame,
        home,
        iconBackArrow,
        inviteFriends,
        inviteSent,
        music,
        myAvatar,
        profileFrame,
        profile,
        rateUs,
        search,
        shareSocials,
        success,
        warning
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
