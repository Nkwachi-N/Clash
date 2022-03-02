
class Game{
  Category? category;
  List<String>? subCategory;
  int? rounds;

  Game({this.category, this.rounds, this.subCategory});

}

enum Category{
  genre,artist
}