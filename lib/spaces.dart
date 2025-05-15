import 'package:flutter/material.dart';

class Spaces extends StatelessWidget {
  const Spaces({super.key});

  final List<Map<String, String>> spaces = const [
    {
      'name': 'Lecture Hall A',
      'image': 'https://via.placeholder.com/150',
      'location': 'Block A, Ground Floor',
    },
    {
      'name': 'Library Study Room',
      'image': 'https://via.placeholder.com/150',
      'location': 'Library, 2nd Floor',
    },
    {
      'name': 'Computer Lab 1',
      'image': 'https://via.placeholder.com/150',
      'location': 'Block B, Room 203',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spaces.length,
      itemBuilder: (context, index) {
        final space = spaces[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                space['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              space['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(space['location']!),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              // TODO: Navigate to space details page later
            },
          ),
        );
      },
    );
  }
}
