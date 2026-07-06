import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  (() async {
    try {
      if (kIsWeb) {
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBwO-T5eGX5u3hyCmZPB9IMn072dtbD-EI",
            authDomain: "flutterhomeserviceapp.firebaseapp.com",
            projectId: "flutterhomeserviceapp",
            storageBucket: "flutterhomeserviceapp.firebasestorage.app",
            messagingSenderId: "243595306296",
            appId: "1:243595306296:web:9636589c738b8a80e88dcd",
            measurementId: "G-N6W5XY0GW0",
          ),
        );
      } else {
        await Firebase.initializeApp();
      }
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
    runApp(const MyApp());
  })();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Services App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}