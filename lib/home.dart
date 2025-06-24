import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sbma_space_booking_mobile_app/booking.dart';
import 'package:sbma_space_booking_mobile_app/space.dart';
import 'package:sbma_space_booking_mobile_app/homepage_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> spaces = [
    {
      'title': 'Auditorium',
      'image': 'assets/images/upsi_audi.jpg',
      'details': 'Capacity: 1165\nAir-conditioned\nProjector available',
      'longDescription': 'The UPSI Auditorium is a premier venue for large events, '
          'featuring state-of-the-art sound systems, comfortable seating for 1165 people '
          'and advanced projection equipment. Ideal for conferences '
          'and academic ceremonies.'
    },
    {
      'title': 'DTC UPSI',
      'image': 'assets/images/upsi_dtc.png',
      'details': 'Capacity: 1500\nLarge Hall\nSpecialized equipment',
      'longDescription': 'Dewan Tuanku Canselor (DTC) UPSI is a premier multipurpose hall with a capacity of 1500, '
          'equipped with specialized facilities for large-scale events, academic functions and technology-driven programs. '
          'The venue supports high-profile conferences, ceremonies and collaborative projects with advanced audiovisual systems and adaptable spaces.'
    },
    {
      'title': 'Arena UPSI',
      'image': 'assets/images/upsi_arena.jpg',
      'details': 'Open space\nSports facilities\nIndoor sports event',
      'longDescription': 'The UPSI Arena is a versatile sports complex suitable '
          'for various indoor sports activities and events, with professional-grade '
          'equipment and facilities. Features include futsal court, '
          'badminton court and a fully-equipped gymnasium.'
    },
    {
      'title': 'Panggung Percubaan',
      'image': 'assets/images/upsi_pp.jpg',
      'details': 'Theater space\nStage lighting\nSound system',
      'longDescription': 'A dedicated theater space with professional lighting '
          'and sound systems, ideal for performances, rehearsals and cultural events. '
          'The space includes dressing rooms, a green room and flexible seating arrangements.'
    },
    {
      'title': 'Bilik Seminar PTB',
      'image': 'assets/images/seminar_ptb.png',
      'details': 'Capacity: 80\nConference setup\nWhiteboard',
      'longDescription': 'The PTB Seminar Room is designed for academic discussions '
          'and presentations, equipped with modern conferencing facilities including '
          'a projector, sound system and comfortable seating for up to 80 participants.'
    },
    {
      'title': 'Meeting Room PTB',
      'image': 'assets/images/meetingroom_ptb.png',
      'details': 'Capacity: 30\nExecutive style\nLED Screen',
      'longDescription': 'An executive meeting room with premium furnishings and '
          'presentation equipment for professional gatherings. Features include a large '
          'LED display, video conferencing capabilities and ergonomic seating.'
    },
    {
      'title': 'IT Training Lab',
      'image': 'assets/images/it_lab.png',
      'details': '22 workstations\nSpecialized software\nLED Screen',
      'longDescription': 'A fully-equipped computer lab with specialized software '
          'for IT training and workshops. The lab features 22 high-performance workstations, '
          'monitors at each station and specialized software for programming, '
          'graphics design and data analysis.'
    },
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: const Text('UPSI Space Booking'),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/upsi_library.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Discover Your Ideal Space at UPSI',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'All UPSI facilities at your fingertips — browse and book instantly.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingsPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            backgroundColor: const Color(0xFFEA923D),
                            foregroundColor: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'BOOK SPACE',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Popular Spaces',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SpacesPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'View More',
                              style: TextStyle(
                                color: Color(0xFFFFA857),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ScrollConfiguration(
                      behavior: const ScrollBehavior().copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: SizedBox(
                        height: 187,
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          itemCount: spaces.length,
                          itemBuilder: (context, index) {
                            final space = spaces[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 4, left: 1),
                              child: _buildSpaceCard(
                                space['title']!,
                                space['image']!,
                                space['details']!,
                                space['longDescription']!,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpaceCard(String title, String imagePath, String details, String longDescription) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDetailsPage(
              home: {
                'name': title,
                'image': imagePath,
                'description': details,
                'longDescription': longDescription,
              },
            ),
          ),
        );
      },
      child: SizedBox(
        width: 180,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 8),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(0),
                    bottom: Radius.circular(0),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: Text(
                  details,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}