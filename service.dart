import 'package:flutter/material.dart';
import 'middle.dart'; // Import the CleaningSelectionScreen

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select a Service")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Which service do you need?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _serviceCard(context, Icons.cleaning_services, "Cleaning"),
                  _serviceCard(context, Icons.plumbing, "Plumber"),
                  _serviceCard(context, Icons.electrical_services, "Electrician"),
                  _serviceCard(context, Icons.format_paint, "Painter"),
                  _serviceCard(context, Icons.handyman, "Carpenter"),
                  _serviceCard(context, Icons.grass, "Gardener"),
                  _serviceCard(context, Icons.brush, "Makeup"),
                  _serviceCard(context, Icons.local_shipping, "Shifting"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceCard(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CleaningSelectionScreen(service: title),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.blue),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
