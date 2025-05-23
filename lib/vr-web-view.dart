import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VRWebViewPage extends StatelessWidget {
  const VRWebViewPage({super.key});

  Future<void> _launchVR() async {
    final url = Uri.parse('https://360vr.my/upsi/');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    _launchVR(); // launch immediately on page open

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opening VR Tour...'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFA000),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
