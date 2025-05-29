import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Booking data model
class BookingItem {
  final String title;
  final String imagePath;
  final String link;
  final String? price;

  BookingItem({
    required this.title,
    required this.imagePath,
    required this.link,
    this.price,
  });
}

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  final List<BookingItem> _bookings = [
    BookingItem(
      title: 'DEWAN SITC',
      imagePath: 'assets/images/sitc.jpg',
      link: 'https://tidycal.com/harizbadnan/dewansitc',
      price: 'RM 100 - RM 180',
    ),
    BookingItem(
      title: 'DEWAN SRI TANJONG',
      imagePath: 'assets/images/seri_tanjung.jpg',
      link: 'https://tidycal.com/harizbadnan/dewansritanjong',
      price: 'RM 450 - RM 600',
    ),
    BookingItem(
      title: 'DEWAN RAHMAN TALIB',
      imagePath: 'assets/images/rahman_talib.jpg',
      link: 'https://tidycal.com/harizbadnan/dewanrahmantalib',
      price: 'RM 900 - RM 1200',
    ),
    BookingItem(
      title: 'DEWAN SULUH BUDIMAN',
      imagePath: 'assets/images/suluh_budiman.jpg',
      link: 'https://tidycal.com/harizbadnan/dewansuluhbudiman',
      price: 'RM 225 - RM 300',
    ),
    BookingItem(
      title: 'AUDITORIUM',
      imagePath: 'assets/images/auditorium.jpg',
      link: 'https://tidycal.com/harizbadnan/auditorium',
      price: 'RM 3450 - RM 4600',
    ),
    BookingItem(
      title: 'Auditorium Utama',
      imagePath: 'assets/images/utama.jpg',
      link: 'https://tidycal.com/harizbadnan/auditorium-utama',
      price: 'RM 1950 - RM 2600',
    ),
    BookingItem(
      title: 'Auditorium 1',
      imagePath: 'assets/images/utama_1.jpg',
      link: 'https://tidycal.com/harizbadnan/auditorium-1',
      price: 'RM 750 - RM 1000',
    ),
    BookingItem(
      title: 'Auditorium 2',
      imagePath: 'assets/images/utama_2.jpg',
      link: 'https://tidycal.com/harizbadnan/auditorium-2',
      price: 'RM 750 - RM 1000',
    ),
    BookingItem(
      title: 'BILIK MESYUARAT UTAMA CANSELORI',
      imagePath: 'assets/images/mesyuarat.jpg',
      link: 'https://tidycal.com/harizbadnan/bilikmesyuaratcanselori',
      price: 'RM 375 - RM 500',
    ),
    BookingItem(
      title: 'BILIK MESYUARAT UTAMA SULUH BUDIMAN',
      imagePath: 'assets/images/1.png',
      link: 'https://tidycal.com/harizbadnan/bilikmesyuaratsuluhbudiman',
      price: 'RM 225 - RM 300',
    ),
    BookingItem(
      title: 'BILIK VIP CANSELORI',
      imagePath: 'assets/images/1-1.png',
      link: 'https://tidycal.com/harizbadnan/bilikvipcanselori',
      price: 'RM 300 - RM 400',
    ),
    BookingItem(
      title: 'BILIK VIP SULUH BUDIMAN',
      imagePath: 'assets/images/2.png',
      link: 'https://tidycal.com/harizbadnan/bilikvipsuluhbudiman',
      price: 'RM 300 - RM 400',
    ),
    BookingItem(
      title: 'BILIK KULIAH KAPASITI 50',
      imagePath: 'assets/images/bil_50.jpg',
      link: 'https://tidycal.com/harizbadnan/bilikkuliahkapasiti50',
      price: 'RM 60 - RM 75',
    ),
    BookingItem(
      title: 'DEWAN KULIAH A',
      imagePath: 'assets/images/kul_A.jpg',
      link: 'https://tidycal.com/harizbadnan/dewankuliaha',
      price: 'RM 280 - RM 375',
    ),
    BookingItem(
      title: 'BILIK KULIAH KAPASITI 10',
      imagePath: 'assets/images/bil_10.jpg',
      link: 'https://tidycal.com/harizbadnan/bilikkuliahkapasiti10',
      price: 'RM 115 - RM 150',
    ),
    // Add other items here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 220, 215),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Booking',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _bookings.length,
          itemBuilder: (context, index) {
            final booking = _bookings[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align to start
                  children: [
                    Image.asset(
                      booking.imagePath,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
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
                                  child: const Icon(
                                    Icons.attach_money,
                                    color: Colors.white,
                                    size: 18,
                                  ),
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
)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
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
