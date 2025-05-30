class Booking {
  final int id;
  final String title;
  final String imagePath;
  final String link;
  final String? price;

  Booking({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.link,
    this.price,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      title: map['title'],
      imagePath: map['image_path'],
      link: map['link'],
      price: map['price'],
    );
  }
}
