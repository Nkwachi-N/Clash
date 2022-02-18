
class User{
  String id;
  String? name;

  User({required this.id, this.name});

  factory User.fromJson(Map<String,dynamic> json) {
    return User(
      id: json['id'],
      name: json['display_name'],
    );
  }
}