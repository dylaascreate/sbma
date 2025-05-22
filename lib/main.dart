import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sbma_space_booking_mobile_app/splash_screen.dart';
import 'package:sbma_space_booking_mobile_app/home_screen.dart';
import 'package:sbma_space_booking_mobile_app/about.dart';
import 'package:sbma_space_booking_mobile_app/space.dart';
import 'package:sbma_space_booking_mobile_app/booking.dart';
import 'package:sbma_space_booking_mobile_app/search.dart';

import 'package:sbma_space_booking_mobile_app/map-web-view.dart';
import 'package:sbma_space_booking_mobile_app/vr-web-view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';


void main() {
  // Register Android WebView platform implementation
  WebViewPlatform.instance = AndroidWebViewPlatform();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UHSB Booking App',
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutPage(),
        '/spaces': (context) => SpacesPage(),
        '/bookings': (context) => BookingsPage(),
        '/search': (context) => SearchPage(),
        '/vr': (context) => VRWebViewPage(),
        '/map': (context) => EmbeddedMapPage(),
      },  
      theme: ThemeData(
        primarySwatch: Colors.amber, fontFamily: 'Poppins'),
        home: SplashScreen(),
    );
  }
}
