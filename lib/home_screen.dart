import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sbma_space_booking_mobile_app/about.dart';
import 'package:sbma_space_booking_mobile_app/booking.dart';
import 'package:sbma_space_booking_mobile_app/home.dart';
import 'package:sbma_space_booking_mobile_app/space.dart';
import 'package:sbma_space_booking_mobile_app/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // This is tab pages
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home', style: optionStyle),
  //   Text('Spaces', style: optionStyle),
  //   Text('Bookings', style: optionStyle),
  //   Text('About', style: optionStyle),
  // ];

  // This is single pages
final List<Widget> _pages = const [ // List of pages to be displayed
    SpacesPage(), // index 0
    HomePage(), // index 1 ---> showing this page first
    BookingsPage(), // index 2 
    SearchPage(), // index 3
    AboutPage(), // index 4
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
        icon: const Icon(LineIcons.infoCircle),
        onPressed: () {
          setState(() {
            _selectedIndex = 4; // Navigate to Search page
          });
        },
      ),
      title: const Text('UPSI Space'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 255, 162, 0),
      actions: [
        IconButton(
          icon: const Icon(LineIcons.search),
          onPressed: () {
            setState(() {
              _selectedIndex = 3; // Navigate to About page
            });
          },
        ),
      ],
    ),
      body: IndexedStack( // Use IndexedStack to maintain the state of each page
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav( // Google Navigation Bar
              selectedIndex: _selectedIndex, // Set the selected index  
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color.fromARGB(255, 255, 162, 0),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.cube,
                  text: 'Spaces',
                ),
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.calendar,
                  text: 'Bookings',
                ),
              ],
              // selectedIndex: _selectedIndex,
              // onTabChange: (index) {
              //   setState(() {
              //     _selectedIndex = index;
              //   });
              // },
              onTabChange: (index) { // Update the selected index and change the page
                setState(() => _selectedIndex = index);
              },


            ),
          ),
        ),
      ),
    );
  }
}
