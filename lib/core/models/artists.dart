class Artist {
  String id;
  String image;
  String name;

  Artist({
    required this.name,
    required this.id,
    required this.image,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'],
      id: json['id'],
      image: json['images'][0]['url'],
    );
  }

}
