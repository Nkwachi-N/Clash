class Track {
  String name;
  List<String> artists;
  String? audioUrl;
  String albumName;
  String imageUrl;
  int popularity;
  String id;

  Track({
    required this.name,
    required this.artists,
    required this.audioUrl,
    required this.imageUrl,
    required this.id,
    required this.albumName,
    required this.popularity,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      name: json['name'],
      artists: json['artists']
          .map<String>((json) => json['name'] as String)
          .toList(),
      audioUrl: json['preview_url'],
      imageUrl: json['album']['images'][0]['url'],
      albumName: json['album']['name'],
      popularity: json['popularity'],
      id: json['id'],
    );
  }
}
