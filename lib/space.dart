import 'package:flutter/material.dart';

class SpacesPage extends StatelessWidget {
  const SpacesPage({super.key});

  final List<Map<String, String>> _allItems = const [
    {
      'title': 'Meeting Room A',
      'description': 'Perfect for team meetings and group discussions.',
      'image': 'assets/images/uhsb_logo.png',
    },
    {
      'title': 'Lecture Hall B',
      'description': 'Large hall suitable for lectures and seminars.',
      'image': 'assets/images/uhsb_logo.png',
    },
    {
      'title': 'Discussion Room C',
      'description': 'Ideal for small group discussions or tutoring.',
      'image': 'assets/images/uhsb_logo.png',
    },
    {
      'title': 'Library Zone D',
      'description': 'Quiet study zone with ample seating.',
      'image': 'assets/images/uhsb_logo.png',
    },
    {
      'title': 'Computer Lab E',
      'description': 'Equipped with computers and high-speed internet.',
      'image': 'assets/images/uhsb_logo.png',
    },
    {
      'title': 'Auditorium F',
      'description': 'Spacious auditorium for presentations and performances.',
      'image': 'assets/images/uhsb_logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaces'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _allItems.length,
        itemBuilder: (context, index) {
          final item = _allItems[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              title: Text(
                item['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['description']!),
            ),
          );
        },
      ),
    );
  }
}
