import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'space_details_page.dart';

class SpacesPage extends StatefulWidget {
  const SpacesPage({super.key});

  @override
  State<SpacesPage> createState() => _SpacesPageState();
}

class _SpacesPageState extends State<SpacesPage> {
  String selectedCategory = 'all';

  Stream<QuerySnapshot> getSpacesStream() {
    final collection = FirebaseFirestore.instance.collection('bookings');
    if (selectedCategory == 'all') {
      return collection.snapshots();
    } else {
      return collection
          .where('category', isEqualTo: selectedCategory)
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spaces'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Category:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: selectedCategory == 'all',
                  onSelected: (_) => setState(() => selectedCategory = 'all'),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Hall / Room'),
                  selected: selectedCategory == 'hall',
                  onSelected: (_) => setState(() => selectedCategory = 'hall'),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Sports'),
                  selected: selectedCategory == 'sport',
                  onSelected: (_) => setState(() => selectedCategory = 'sport'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: getSpacesStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong.'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final docs = snapshot.data!.docs;

                  return GridView.builder(
                    itemCount: docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 2.1,
                    ),
                    itemBuilder: (context, index) {
                      final data = docs[index].data() as Map<String, dynamic>;
                      final stringData = data.map(
                        (key, value) => MapEntry(key, value.toString()),
                      );

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpaceDetailsPage(space: stringData),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Image.asset(
        stringData['imagePath'] ?? '',
        height: 83,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 83,
            color: Colors.grey.shade300,
            child: const Icon(Icons.broken_image, size: 40),
          );
        },
      ),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          stringData['title'] ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ],
),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
