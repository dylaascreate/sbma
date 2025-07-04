import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _allItems = [];
  List<Map<String, dynamic>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _fetchItemsFromDatabase();
  }

  void _fetchItemsFromDatabase() async {
    final snapshot = await FirebaseFirestore.instance.collection('bookings').get();

    final items = snapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    setState(() {
      _allItems = items;
      _filteredItems = items; // Show all initially
    });
  }

  void _filterSearch(String query) {
    final lowerQuery = query.toLowerCase();

    final results = _allItems.where((item) {
      final title = item['title']?.toString().toLowerCase() ?? '';
      return title.contains(lowerQuery);
    }).toList();

    setState(() {
      _filteredItems = results;
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
        title: const Text('Search'),
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
                  borderRadius: BorderRadius.circular(12),
                ),
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
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                title: Text(item['title'] ?? ''),
                                subtitle: Text(item['description'] ?? ''),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item['imagePath'] ?? '',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.image),
                                  ),
                                  
                                ),
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
