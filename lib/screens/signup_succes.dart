import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class SignupSuccess extends StatelessWidget {
  const SignupSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft, //  Green starts from the top-left
            radius: 0.7, // Small effect, does not cover full screen
            colors: [
              Color.fromARGB(255, 87, 144, 122), // Small green tint in top-left
              Color(0xFF1B232A), // Original dark background
            ],
            stops: [0.01, 2], //  Green fades out quickly
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              Image.asset(
                "assets/images/signup.png",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                'Your account has been ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'successfully created!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5ED5A8),
                  fixedSize: const Size(366, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
