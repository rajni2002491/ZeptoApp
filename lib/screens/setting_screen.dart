import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFF1B232A),
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
         backgroundColor: const Color(0xFF1B232A),
        elevation: 0,
        leading: BackButton(
          color: const Color(0xFF5ED5A8),
          onPressed: () {
            Navigator.pop(context); // 👈 Go back to the previous screen
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Divider(color: Colors.white),

          // Settings Items
          _buildSettingItem(context, "Language", Icons.language, "English"),
          _buildSettingItem(context, "Appearance", Icons.settings, "Device settings"),
          _buildSettingItem(context, "About Us", Icons.info, "v1.2.3"),

          const SizedBox(height: 30),

          // ✅ Logout Option
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF5ED5A8)),
            title: const Text("Logout", style: TextStyle(color: Colors.white)),
            onTap: () async {
              await FirebaseAuth.instance.signOut(); // 🔐 Sign out user

              // 👇 Navigate to login screen (make sure '/login' is your route for LoginScreen)
              Navigator.pushNamedAndRemoveUntil(
                // ignore: use_build_context_synchronously
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, IconData icon, String rightText) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF5ED5A8)),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rightText,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.arrow_forward_ios, color: Color(0xFF5ED5A8), size: 16),
        ],
      ),
      onTap: () {
        // Add your onTap logic here if needed
      },
    );
  }
}
