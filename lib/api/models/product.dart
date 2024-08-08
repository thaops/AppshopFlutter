class Product {
  final String id;
  final String name;
  final String img;
  final int price;
  final String title;
  final String categoryId;

  Product({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.title,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      img: json['img'],
      price: json['gia'],
      title: json['title'],
      categoryId: json['categoryId'],
    );
  }
}
