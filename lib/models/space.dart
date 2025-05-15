class Space {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String location;
  final double price;

  Space({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.price,
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      price: json['price'].toDouble(),
    );
  }
}
