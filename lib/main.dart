import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // ✅ Add this
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'package:sbma_space_booking_mobile_app/splash_screen.dart';
import 'package:sbma_space_booking_mobile_app/home_screen.dart';
import 'package:sbma_space_booking_mobile_app/about.dart';
import 'package:sbma_space_booking_mobile_app/space.dart';
import 'package:sbma_space_booking_mobile_app/booking.dart';
import 'package:sbma_space_booking_mobile_app/search.dart';
import 'package:sbma_space_booking_mobile_app/map-web-view.dart';
import 'package:sbma_space_booking_mobile_app/vr-web-view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Required before Firebase init
  await Firebase.initializeApp();            // ✅ Initialize Firebase

  WebViewPlatform.instance = AndroidWebViewPlatform();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UHSB Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutPage(),
        '/spaces': (context) => SpacesPage(),
        '/bookings': (context) => BookingsPage(),
        '/search': (context) => SearchPage(),
        '/vr': (context) => VRWebViewPage(),
        '/map': (context) => EmbeddedMapPage(),
      },
      home: SplashScreen(),
    );
  }
}
