import 'package:flutter/material.dart';

class HomeDetailsPage extends StatelessWidget {
  final Map<String, String> home;

  const HomeDetailsPage({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(home['name'] ?? 'Space Details'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (home['image'] != null && home['image']!.isNotEmpty)
                  Image.asset(
                    home['image']!,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        home['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        home['description'] ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        home['longDescription'] ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5, // Line height for better readability
                        ),
                        textAlign: TextAlign.justify, // This enables justified alignment
                      ),
                      const SizedBox(height: 80), // Space for the fixed button
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Static button at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}