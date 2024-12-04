// File: lib/pages/welcome_page.dart

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4EE), // Warna latar belakang yang mirip dengan gambar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '/image/logo.png', // Pastikan file gambar ada di direktori ini
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'RE-STORE',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF336B63),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lama Rasa Baru',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF336B63),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF336B63),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                'Mulai Sekarang',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
