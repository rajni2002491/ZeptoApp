import 'package:flutter/material.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _switchPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B232A), // Dark Background
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Sliding Tab Box
            Container(
              width: 360,
              height: 63,
              decoration: BoxDecoration(
                color: const Color(0xFF161C22),
                borderRadius: BorderRadius.all(Radius.circular(14)), // Black Background
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _tabButton("Sign in", 0),
                  _tabButton("Sign up", 1),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: [
                  _buildPage(const SignInScreen()),
                  _buildPage(const SignupScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String text, int index) {
    return GestureDetector(
      onTap: () => _switchPage(index),
      child: Container(
        width: 170,
        height: 50,
        color: _selectedIndex == index ? const Color(0xFF1B232A) : const Color(0xFF161C22), // Black Background
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPage(Widget page) {
    return Container(
      color: const Color(0xFF1B232A), // Sign In & Sign Up Background
      child: page,
    );
  }
}
