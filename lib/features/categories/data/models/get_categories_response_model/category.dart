class Category {
  num? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  factory Category.fromJson(json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
