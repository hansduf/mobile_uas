import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFFDF4EC),
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Registrasi',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 30.0),
              const FieldWithLabel(
                label: 'Nama',
                hintText: 'Masukkan nama Anda',
              ),
              const SizedBox(height: 10.0),
              const FieldWithLabel(
                label: 'Email',
                hintText: 'Masukkan email Anda',
              ),
              const SizedBox(height: 10.0),
              const FieldWithLabel(
                label: 'Password',
                hintText: 'Masukkan password Anda',
                isPassword: true,
              ),
              const SizedBox(height: 10.0),
              const FieldWithLabel(
                label: 'Confirm Password',
                hintText: 'Konfirmasi password Anda',
                isPassword: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15.0,
                  ),
                  backgroundColor: Colors.teal, // Warna tombol default
                  foregroundColor: const Color(0xFFFCECDD), // Warna teks tombol
                  shadowColor: Colors.teal.shade700,
                  elevation: 4.0,
                ).copyWith(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.teal.shade700; // Warna lebih gelap saat ditekan
                      }
                      return Colors.teal; // Warna default
                    },
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FieldWithLabel extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;

  const FieldWithLabel({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, color: Colors.teal),
        ),
        const SizedBox(height: 5.0),
        TextField(
          obscureText: isPassword,
          focusNode: FocusNode(), // Menghindari highlight
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 15.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.teal),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.teal),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}
