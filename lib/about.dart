    import 'package:flutter/material.dart';
    // import 'package:url_launcher/url_launcher.dart';
    import 'package:line_icons/line_icons.dart';

    class AboutPage extends StatelessWidget {
      const AboutPage({super.key});

      // // URLs
      // static const String mapUrl =
      //     'https://maps.app.goo.gl/Txpe7B4FDS7qPrdZ8';
      // static const String vrUrl = 'https://360vr.my/upsi/';

      // Future<void> _launchUrl(BuildContext context, String url) async {
      //   try {
      //     final uri = Uri.parse(url);
      //     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      //       throw 'Could not launch $url';
      //     }
      //   } catch (e, stackTrace) {
      //     // Shows proper error in debug console & UI
      //     debugPrint('ERROR launching URL: $e\n$stackTrace');
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Could not open the link: $url')),
      //     );
      //   }
      // }


      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('About Us'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/uhsb_logo.png'),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'UHSB Booking App',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 34, 34, 34),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Smart solution for reserving spaces efficiently at UPSI.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const Divider(height: 40, thickness: 1),
                      const ListTile(
                        leading: Icon(Icons.person, color: Colors.orange),
                        title: Text('Developed by'),
                        subtitle: Text('Axis Team'),
                      ),
                      ListTile(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (_) => const EmbeddedMapPage()),
                          // );
                          Navigator.of(context).pushNamed('/map');
                        },

                        leading: const Icon(Icons.location_on, color: Colors.orange),
                        title: const Text('Address'),
                        subtitle: const Text('UPSI, Perak, Malaysia'),
                        trailing: const Icon(LineIcons.map, color: Colors.orange),
                      ),
                      const ListTile(
                        leading: Icon(Icons.email, color: Colors.orange),
                        title: Text('Email'),
                        subtitle: Text('contact@upsi.edu.my'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone, color: Colors.orange),
                        title: Text('Phone'),
                        subtitle: Text('+60 12-345 6789'),
                      ),
                      const SizedBox(height: 30),
                      
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Launching VR view...')),
                          );

                          // Add a slight delay so user sees the snackbar before navigation
                          Future.delayed(const Duration(milliseconds: 500), () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (_) => const VRWebViewPage()),
                            // );
                            Navigator.of(context).pushNamed('/vr');
                          });
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFFA000), Color(0xFFFFC107)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.threesixty, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                'Explore in VR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
