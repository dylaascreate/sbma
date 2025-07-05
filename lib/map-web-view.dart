import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbeddedMapPage extends StatefulWidget {
  const EmbeddedMapPage({super.key});

  @override
  State<EmbeddedMapPage> createState() => _EmbeddedMapPageState();
}

class _EmbeddedMapPageState extends State<EmbeddedMapPage> {
   final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
  Uri.parse('https://www.google.com/maps/embed/v1/place?q=Sultan+Idris+Education+University&key=AIzaSyDEXUQ2iJzMyyTcWEH7up_nL_oCoNk-Kv8'),
);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UPSI Map'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFA000),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

// v2
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class NativeMapPage extends StatefulWidget {
//   const NativeMapPage({super.key});

//   @override
//   State<NativeMapPage> createState() => _NativeMapPageState();
// }

// class _NativeMapPageState extends State<NativeMapPage> {
//   late GoogleMapController mapController;

//   final LatLng _upsiLocation = const LatLng(3.7150, 101.5420); // UPSI coords

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('UPSI Native Map'),
//         backgroundColor: const Color(0xFFFFA000),
//         centerTitle: true,
//       ),
//       body: GoogleMap(
//         onMapCreated: (controller) => mapController = controller,
//         initialCameraPosition: CameraPosition(
//           target: _upsiLocation,
//           zoom: 16,
//         ),
//         markers: {
//           Marker(
//             markerId: const MarkerId('upsi'),
//             position: _upsiLocation,
//             infoWindow: const InfoWindow(
//               title: 'Universiti Pendidikan Sultan Idris',
//             ),
//           ),
//         },
//         myLocationButtonEnabled: true,
//         zoomControlsEnabled: true,
//       ),
//     );
//   }
// }
