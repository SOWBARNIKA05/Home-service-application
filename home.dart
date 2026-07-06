import 'package:flutter/material.dart';
import 'service.dart'; // Importing ServicePage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Easy, reliable way to take care of your home",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "We provide you with the best people to help take care of your home.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.cleaning_services, "Cleaning"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.plumbing, "Plumber"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.electrical_services, "Electrician"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.format_paint, "Painter"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.handyman, "Carpenter"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.grass, "Gardener"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.cut, "Tailor"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.cleaning_services_outlined, "Maid"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.drive_eta, "Driver"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.brush,"Makeup"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));

                  },
                  child: _serviceIcon(Icons.local_shipping,"Shifting"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 118, 181, 233),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));
                },
                child: const Text("Get Started", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _serviceIcon(IconData icon, String title) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
