import 'package:flutter/material.dart';

import 'pages/detail.dart';
import 'pages/homepage.dart'; // Import the HomePage file
import 'pages/keranjang.dart';
import 'pages/login.dart'; // Import file login_screen.dart
import 'pages/register.dart'; // Import file register_page.dart
import 'pages/welcome_page.dart';
import 'pages/whislist.dart'; // Ganti dengan jalur file Anda


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RE-STORE',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/', // Halaman pertama yang muncul
      routes: {
        '/': (context) => WelcomePage(), // Halaman awal (WelcomePage)
        '/login': (context) => const LoginScreen(), // Halaman LoginScreen
        '/register': (context) => const RegisterPage(), // Halaman RegisterPage
        '/keranjang': (context) => const CartPage(), // Halaman Keranjang
        '/home': (context) => HomePage(),
        '/wishlist': (context) => const WishlistScreen(),
         '/tambah': (context) => const WishlistScreen(),  // Main page route
        '/detail': (context) => const Detail(),
      },
    );
  }
}
