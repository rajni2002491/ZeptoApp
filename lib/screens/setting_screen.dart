import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Divider(color: Colors.white),

          // Language Setting
          _buildSettingItem("Language", Icons.language, "English"),

          // Appearance Setting
          _buildSettingItem("Appearance", Icons.settings, "Device settings"),

          // About Us Section
          _buildSettingItem("About Us", Icons.info, "v1.2.3"),
        ],
      ),
    );
  }

  // Method to create setting items with right-side text and right arrow
  Widget _buildSettingItem(String title, IconData icon, String rightText) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF5ED5A8)), // Updated icon color
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
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF5ED5A8), 
            size: 16,
          ),
        ],
      ),
      onTap: () {
        // Handle setting item tap
      },
    );
  }
}
