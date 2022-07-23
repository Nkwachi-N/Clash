
class Game{
  Category? category;
  int? rounds;

  Game({this.category, this.rounds, });

  Map<String, dynamic> toFirestore() {
    return {
      if (category != null) "category": category?.name,
      if (rounds != null) "rounds": rounds,

    };
  }

}

enum Category{
  genre,artist
}

