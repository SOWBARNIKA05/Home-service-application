import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String image;

  const ProfilePage({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 60,
            ),
            const SizedBox(height: 15),
            Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("⭐ 4.5", style: TextStyle(fontSize: 18, color: Colors.orange)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Booking logic here
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Book Now", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
