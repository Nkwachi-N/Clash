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

  /// File path: assets/images/Spotify_Icon_White.png
  AssetGenImage get spotifyIconWhite =>
      const AssetGenImage('assets/images/Spotify_Icon_White.png');

  /// File path: assets/images/X42.png
  AssetGenImage get x42 => const AssetGenImage('assets/images/X42.png');

  /// File path: assets/images/avatar_1.png
  AssetGenImage get avatar1 =>
      const AssetGenImage('assets/images/avatar_1.png');

  /// File path: assets/images/avatar_2.png
  AssetGenImage get avatar2 =>
      const AssetGenImage('assets/images/avatar_2.png');

  /// File path: assets/images/avatar_3.png
  AssetGenImage get avatar3 =>
      const AssetGenImage('assets/images/avatar_3.png');

  /// File path: assets/images/avatar_4.png
  AssetGenImage get avatar4 =>
      const AssetGenImage('assets/images/avatar_4.png');

  /// File path: assets/images/avatar_5.png
  AssetGenImage get avatar5 =>
      const AssetGenImage('assets/images/avatar_5.png');

  /// File path: assets/images/avatar_6.png
  AssetGenImage get avatar6 =>
      const AssetGenImage('assets/images/avatar_6.png');

  /// File path: assets/images/avatar_7.png
  AssetGenImage get avatar7 =>
      const AssetGenImage('assets/images/avatar_7.png');

  /// File path: assets/images/avatar_8.png
  AssetGenImage get avatar8 =>
      const AssetGenImage('assets/images/avatar_8.png');

  /// File path: assets/images/avatar_9.png
  AssetGenImage get avatar9 =>
      const AssetGenImage('assets/images/avatar_9.png');

  /// File path: assets/images/exclamation.png
  AssetGenImage get exclamation =>
      const AssetGenImage('assets/images/exclamation.png');

  /// File path: assets/images/home.svg
  String get home => 'assets/images/home.svg';

  /// File path: assets/images/invite_sent.png
  AssetGenImage get inviteSent =>
      const AssetGenImage('assets/images/invite_sent.png');

  /// File path: assets/images/profile.svg
  String get profile => 'assets/images/profile.svg';

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/stat.svg
  String get stat => 'assets/images/stat.svg';

  /// File path: assets/images/success.png
  AssetGenImage get success => const AssetGenImage('assets/images/success.png');

  /// File path: assets/images/warning.png
  AssetGenImage get warning => const AssetGenImage('assets/images/warning.png');
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
    double? scale = 1.0,
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

  String get path => _assetName;
}
