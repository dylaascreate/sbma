import 'package:flutter/material.dart';
import 'package:sbma_space_booking_mobile_app/splash_screen.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.brown, fontFamily: 'Poppins'),
        home: SplashScreen(),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget{
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Google Nav Bar"),
//         ),
//       ),
//     );
//   }
// }