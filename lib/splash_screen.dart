import 'package:flutter/material.dart';
import 'package:sbma_space_booking_mobile_app/particle.dart';
import 'package:sbma_space_booking_mobile_app/particle_painter.dart';
import 'dart:math' as math;
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _backgroundController;
  late AnimationController _textController;
  late AnimationController _particleController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _backgroundAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _logoRotationAnimation;
  late Animation<double> _textOpacityAnimation;

  final List<Particle> _particles = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i<50; i++){
      _particles.add(
        Particle(
          position: Offset(
            math.Random().nextDouble() * 400 - 200,
            math.Random().nextDouble() * 400 - 200,
          ),
          color: Color.fromRGBO(
            math.Random().nextInt(255),
            math.Random().nextInt(255), 
            255,
            math.Random().nextDouble() * 0.6 + 0.2,
          ),
          size: math.Random().nextDouble() * 10 + 5,
          speed: math.Random().nextDouble() * 2 + 1,
        ),
      );
    }

  _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();

    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.elasticInOut
      ),
    );

    _logoRotationAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeInOutCubic,
      ),
    );

    _backgroundAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _backgroundController,
        curve: Curves.easeInOut,
      ),
    );

  _textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Interval(0.5, 1.0, curve: Curves.easeIn), 
      ),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
      parent: _textController,
      curve: Interval(0.5, 1.0, curve: Curves.easeOut),
    ));

    _backgroundController.forward();

    Future.delayed(const Duration(milliseconds: 500), () {
      _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      _textController.forward();
    });

    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
          ),
      );
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _backgroundController.dispose();
    _textController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack( // Stack widget to overlay the background and particles
        children: [
          AnimatedBuilder(
            animation: _backgroundController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.lerp(Colors.black, Colors.amber.shade800,
                          _backgroundAnimation.value)!,
                      Color.lerp(Colors.black, Colors.amber.shade500,
                          _backgroundAnimation.value)!,
                    ],
                  ),
                ),
              );
            },
          ),

          AnimatedBuilder(
            animation: _particleController,
            builder: (context, child) {
              return CustomPaint(
                painter: ParticlePainter(
                  particles: _particles,
                  animation: _particleController.value,
                ),
                size: Size.infinite,
              );
            },
          ),

          Center(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _logoController,
                  builder: (context, child){
                    return Transform.scale(
                      scale: _logoScaleAnimation.value,
                      child: Transform.rotate(
                        angle: _logoRotationAnimation.value,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            // child: Icon(
                            //   Icons.flutter_dash,
                            //   color: Color(0xFF1A2980),
                            //   size: 80,
                            // ),
                            child: ClipOval( // Clip the image to a circle
                              child: Image.asset(
                                'images/uhsb_logo.png',
                                fit: BoxFit.cover,
                                width: 100,  // Set width and height to ensure it's a circle
                                height: 100,
                              ),
                            ),

                          ),
                        ),
                      ),
                    );
                  },
                ),
                
                SizedBox(height: 40), // Add some space between the logo and the text

                SlideTransition(
                  position: _textSlideAnimation,
                  child: FadeTransition(
                    opacity: _textOpacityAnimation,
                    child: Column( // Add a Column widget to stack the text widgets
                      children: [
                        Text(
                          "UPSI Space",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10), // Add some space between the text widgets
                        Text(
                          "Find Your Perfect Space at UPSI",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ]
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
} 