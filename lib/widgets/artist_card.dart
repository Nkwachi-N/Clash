import 'package:clash_flutter/src/core/models/artists.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


class ArtistCard extends StatelessWidget {
  final Artist artist;

  const ArtistCard({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.0, 0.98),
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: artist.image,
                fit: BoxFit.fitWidth,

              ),
            ),
          ),
        ),
        Text(
          artist.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
