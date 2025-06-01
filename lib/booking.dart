// lib/screens/booking_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:webview_flutter/webview_flutter.dart';
import '../controller/booking_controller.dart'; // Import your BookingController
import '../model/booking_model.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  void initState() {
    super.initState();
    // Fetch bookings when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookingController>(context, listen: false).fetchBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Bookings',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<BookingController>(context, listen: false).fetchBookings();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<BookingController>( // Use Consumer to rebuild when BookingController notifies listeners
          builder: (context, bookingController, child) {
            if (bookingController.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (bookingController.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Failed to load bookings.'),
                    ElevatedButton(
                      onPressed: () => bookingController.fetchBookings(),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            } else if (bookingController.bookings.isEmpty) {
              return const Center(
                child: Text('No bookings found. Tap refresh to try again!'),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: bookingController.bookings.length, // Use data from controller
                itemBuilder: (context, index) {
                  final booking = bookingController.bookings[index]; // Use Booking model

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display image
                          // Check if it's a network image or asset
                          booking.imagePath.startsWith('http') || booking.imagePath.startsWith('https')
                              ? Image.network(
                                  booking.imagePath,
                                  width: double.infinity,
                                  height: 220,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox(
                                        height: 220,
                                        child: Center(child: Icon(Icons.broken_image)),
                                      ), // Fallback for network image errors
                                )
                              : Image.asset( // For local assets
                                  booking.imagePath,
                                  width: double.infinity,
                                  height: 220,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox(
                                        height: 220,
                                        child: Center(child: Icon(Icons.broken_image)),
                                      ), // Fallback for asset errors
                                ),
                          Padding(
                            
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                            child: Text(
                              booking.title,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Price bubble
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFF6F00),
                                          shape: BoxShape.circle,
                                        ),
                                        // child: const Icon(
                                        //   Icons.attach_money_outlined,
                                        //   color: Colors.white,
                                        //   size: 18,
                                        // ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        booking.price ?? 'N/A',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => WebViewPage(
                                            title: booking.title,
                                            url: booking.link,
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 233, 185, 65),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      textStyle: const TextStyle(fontSize: 16),
                                    ),
                                    child: const Text(
                                      'Book Now',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String title;
  final String url;

  const WebViewPage({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107),
        title: Text(title),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}