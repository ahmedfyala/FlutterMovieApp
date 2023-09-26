class CategoryNameModel {
  String? categoryName;
  int? categoryId;

  CategoryNameModel({this.categoryName, this.categoryId});

  factory CategoryNameModel.fromJson(Map<String, dynamic> data) {
    return CategoryNameModel(
      categoryName: data['name'],
      categoryId: data['id'],
    );
  }
}
