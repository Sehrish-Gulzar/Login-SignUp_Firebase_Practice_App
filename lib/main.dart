import 'package:fire_base_demo/screens/details/components/cart_management.dart';
import 'package:fire_base_demo/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()), // Provide CartModel
        // Other providers if any
      ],
      child: MaterialApp(
        title: 'Your App Title',
        home: HomeScreen(),
      ),
    );
  }
}
