import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allItems = [
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

  List<Map<String, String>> _filteredItems = [];

  void _filterSearch(String query) {
    final results = query.isEmpty
        ? []
        : _allItems
            .where((item) =>
                item['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();

    setState(() {
      _filteredItems = results.cast<Map<String, String>>();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Spaces'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterSearch,
              decoration: InputDecoration(
                hintText: 'Search spaces...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _searchController.text.isEmpty
                  ? const SizedBox()
                  : _filteredItems.isNotEmpty
                      ? ListView.builder(
                          itemCount: _filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = _filteredItems[index];

                            return Card(
                              elevation: 3,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(item['description']!),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            'No results found.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
