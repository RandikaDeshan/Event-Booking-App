class CategoryModel{
  final String name;
  final String id;
  final String color;

  CategoryModel({
    required this.name,
    required this.id,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String,dynamic> json) {
    return CategoryModel(
        name: json['name'],
        id: json['id'],
        color: json['color'],

    );
  }



}