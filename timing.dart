import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'payment.dart';

class TimingPage extends StatefulWidget {
  const TimingPage({super.key});

  @override
  _TimingPageState createState() => _TimingPageState();
}

class _TimingPageState extends State<TimingPage> {
  DateTime? selectedDate;
  String selectedMonth = DateFormat.MMMM().format(DateTime.now());
  String selectedTime = "10:00 AM"; // Default time

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color.fromRGBO(255, 118, 181, 233),
            colorScheme: const ColorScheme.light(primary: Color.fromARGB(255, 118, 181, 233)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedMonth = DateFormat.MMMM().format(picked);
      });
    }
  }

  // Function to show time picker
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 0),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date & Time"),
        backgroundColor: const Color.fromARGB(255, 118, 181, 233),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Month Selector
              const Text(
                "Choose Month",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  12,
                  (index) {
                    String month = DateFormat.MMMM().format(
                      DateTime(2023, index + 1, 1),
                    );
                    return ChoiceChip(
                      label: Text(month),
                      selected: selectedMonth == month,
                      onSelected: (selected) {
                        setState(() {
                          selectedMonth = month;
                        });
                      },
                      selectedColor: const Color.fromARGB(255, 118, 181, 233),
                      backgroundColor: Colors.grey[300],
                      labelStyle: TextStyle(
                        color: selectedMonth == month ? Colors.white : Colors.black,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Date Picker
              const Text(
                "Choose Date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 118, 181, 233)),
                child: Text(
                  selectedDate == null
                      ? "Pick a Date"
                      : DateFormat("dd MMMM, yyyy").format(selectedDate!),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // Time Picker
              const Text(
                "Choose Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 118, 181, 233)),
                child: Text(
                  selectedTime,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),

              // Proceed Button
              ElevatedButton(
                onPressed: () {
                  if (selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a date")),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: const Text(
                  "Proceed to payment",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
