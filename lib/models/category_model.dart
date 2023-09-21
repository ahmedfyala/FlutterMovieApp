import 'dart:ui';

class CategoryModel {
  String id;
  String name;

  CategoryModel(
    this.id,
    this.name,
  );

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        "28",
        "Action",
      ),
      CategoryModel(
        "12",
        "Adventure",
      ),
      CategoryModel(
        "16",
        "Animation",
      ),
      CategoryModel(
        "35",
        "Comedy",
      ),
      CategoryModel(
        "80",
        "Crime",
      ),
      CategoryModel(
        "99",
        "Documentary",
      ),
      CategoryModel(
        "18",
        "Drama",
      ),
      CategoryModel(
        "10751",
        "Family",
      ),
      CategoryModel(
        "14",
        "Fantasy",
      ),
      CategoryModel(
        "36",
        "History",
      ),
      CategoryModel(
        "10402",
        "Music",
      ),
      CategoryModel(
        "9648",
        "Mystery",
      ),
      CategoryModel(
        "10749",
        "Romance",
      ),
      CategoryModel(
        "878",
        "Science Fiction",
      ),
      CategoryModel(
        "10770",
        "TV Movie",
      ),
      CategoryModel(
        "53",
        "Thriller",
      ),
      CategoryModel(
        "10752",
        "War",
      ),
      CategoryModel(
        "37",
        "Western",
      ),
    ];
  }
}
