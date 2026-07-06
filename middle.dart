import 'package:flutter/material.dart';
import 'profile.dart'; // Import ProfilePage

class CleaningSelectionScreen extends StatelessWidget {
  final String service;

  const CleaningSelectionScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    // Dummy profiles with names, images, and prices for different services
    Map<String, List<Map<String, String>>> serviceProfiles = {
      "Cleaning": [
        {"name": "Henny Wilson", "image": "assets/images/1p.jpg", "price": "₹400"},
        {"name": "Lisa Brown", "image": "assets/images/2p.jpg", "price": "₹450"},
        {"name": "John Doe", "image": "assets/images/3p.jpg", "price": "₹500"},
        {"name": "Sophia Clark", "image": "assets/images/4p.jpg", "price": "₹550"},
        {"name": "David Smith", "image": "assets/images/5p.jpg", "price": "₹600"},
      ],
      "Plumber": [
        {"name": "James Lee", "image": "assets/images/plumber1.jpg", "price": "₹700"},
        {"name": "Michael Chen", "image": "assets/images/plumber2.jpg", "price": "₹750"},
      ],
      "Electrician": [
        {"name": "Robert White", "image": "assets/images/elec1.jpg", "price": "₹800"},
        {"name": "Sam Green", "image": "assets/images/elec2.jpg", "price": "₹850"},
      ],
      "Painter": [
        {"name": "Alice Brown", "image": "assets/images/painter1.jpg", "price": "₹650"},
        {"name": "George Miller", "image": "assets/images/painter2.jpg", "price": "₹700"},
      ],
      "Carpenter": [
        {"name": "Tom Harris", "image": "assets/images/carpenter1.jpg", "price": "₹750"},
      ],
      "Gardener": [
        {"name": "Daniel Scott", "image": "assets/images/gardener1.jpg", "price": "₹500"},
      ],
      "Makeup": [
        {"name": "Emily Watson", "image": "assets/images/makeup1.jpg", "price": "₹1500"},
      ],
      "Shifting": [
        {"name": "Shawn Mendes", "image": "assets/images/shifting1.jpg", "price": "₹1200"},
      ],
    };

    // Get the profiles for the selected service, or default to Cleaning if not found
    List<Map<String, String>> selectedProfiles =
        serviceProfiles[service] ?? serviceProfiles["Cleaning"]!;

    return Scaffold(
      appBar: AppBar(title: Text("Select a $service Specialist")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: selectedProfiles.length,
          itemBuilder: (context, index) {
            var person = selectedProfiles[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        name: person["name"]!,
                        image: person["image"]!,
                        price: person["price"]!, // Passing price
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(person["image"]!),
                      radius: 30,
                    ),
                    title: Text(
                      person["name"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Charges: ${person["price"]} per hour",
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
