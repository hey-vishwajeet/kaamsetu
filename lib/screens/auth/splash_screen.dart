import 'dart:async';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.login,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.work_outline_rounded,
                  size: 55,
                  color: Color(0xFF3157C8),
                ),
              ),

              const SizedBox(height: 30),

              // App Name
              const Text(
                "CareerConnect",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF243B70),
                ),
              ),

              const SizedBox(height: 12),

              // Tagline
              const Text(
                "Discover opportunities.\nBuild your future.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 45),

              // Loading Indicator
              const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Color(0xFF3157C8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}