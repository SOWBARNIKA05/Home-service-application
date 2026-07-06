import 'package:flutter/material.dart';
import 'payment_success.dart'; // Ensure correct import path

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedPaymentIndex = -1;
  final _formKey = GlobalKey<FormState>();
  String cardNumber = "", expiryDate = "", cvv = "", upiId = "";

  void _submitPayment() {
    if ((selectedPaymentIndex == 1 || selectedPaymentIndex == 2) && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else if (selectedPaymentIndex == 0 || selectedPaymentIndex == 3) {
      if (upiId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid ID")),
        );
        return;
      }
    } else if (selectedPaymentIndex == 4) {
      // Cash on Delivery selected — no additional input needed
      // You can add any logic if needed
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a payment method")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.blue.shade700;
    final secondaryColor = Colors.blue.shade100;

    List<Map<String, dynamic>> paymentMethods = [
      {"name": "Google Pay", "icon": Icons.account_balance_wallet_rounded},
      {"name": "Debit Card", "icon": Icons.credit_card_rounded},
      {"name": "Credit Card", "icon": Icons.credit_card_rounded},
      {"name": "UPI", "icon": Icons.qr_code_rounded},
      {"name": "Cash on Delivery", "icon": Icons.money}, // New payment option
    ];

    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: const Text("Select Payment Method"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...List.generate(paymentMethods.length, (index) {
              final isSelected = selectedPaymentIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                  border: Border.all(
                    color: isSelected ? primaryColor : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () => setState(() => selectedPaymentIndex = index),
                  child: Row(
                    children: [
                      Icon(
                        paymentMethods[index]["icon"],
                        size: 30,
                        color: isSelected ? Colors.white : primaryColor,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        paymentMethods[index]["name"],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            if (selectedPaymentIndex == 1 || selectedPaymentIndex == 2) ...[
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Card Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          counterText: "",
                        ),
                        maxLength: 16,
                        validator: (value) =>
                            (value == null || value.length != 16) ? "Enter a valid 16-digit card number" : null,
                        onSaved: (value) => cardNumber = value!,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                labelText: "Expiry Date (MM/YY)",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) => (value == null || !RegExp(r"^(0[1-9]|1[0-2])\/\d{2}$").hasMatch(value))
                                  ? "Enter a valid date"
                                  : null,
                              onSaved: (value) => expiryDate = value!,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "CVV",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                counterText: "",
                              ),
                              maxLength: 3,
                              validator: (value) =>
                                  (value == null || value.length != 3) ? "Enter valid CVV" : null,
                              onSaved: (value) => cvv = value!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ] else if (selectedPaymentIndex == 0 || selectedPaymentIndex == 3) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Enter your ID",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => upiId = value,
                ),
              ),
            ] else if (selectedPaymentIndex == 4) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "You have selected Cash on Delivery.\n"
                  "Please prepare the payment in cash upon delivery.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
