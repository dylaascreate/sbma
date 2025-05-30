// import plugins
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import flutter_dotenv

// import pages
import 'package:sbma_space_booking_mobile_app/splash_screen.dart';
import 'package:sbma_space_booking_mobile_app/home_screen.dart';
import 'package:sbma_space_booking_mobile_app/about.dart';
import 'package:sbma_space_booking_mobile_app/space.dart';
import 'package:sbma_space_booking_mobile_app/booking.dart'; // This is your BookingScreen (view)
import 'package:sbma_space_booking_mobile_app/search.dart';
import 'package:sbma_space_booking_mobile_app/map-web-view.dart';
import 'package:sbma_space_booking_mobile_app/vr-web-view.dart';

// import controller and model (paths already correct if they are in root of lib)
import 'model/booking_model.dart';
import 'controller/booking_controller.dart';

// --- Main function now async to load dotenv ---
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Make sure this is not commented out
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookingController()..fetchBookings(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UHSB Booking App',
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => SplashScreen(), // If you have a named route for '/', avoid setting home
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutPage(),
        '/spaces': (context) => SpacesPage(),
        '/bookings': (context) => BookingsPage(), // Use BookingScreen here for your booking view
        '/search': (context) => SearchPage(),
        '/vr': (context) => VRWebViewPage(),
        '/map': (context) => EmbeddedMapPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(), // SplashScreen is the initial route
    );
  }
}