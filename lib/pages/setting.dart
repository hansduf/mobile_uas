import 'package:flutter/material.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF005F73)),
          onPressed: () {
            // Tambahkan navigasi kembali
          },
        ),
        title: const Text(
          "Pengaturan Akun",
          style: TextStyle(
            color: Color(0xFF005F73),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildSectionTitle("Akun Saya"),
                buildListTile("Akun & Keamanan"),
                buildListTile("Alamat Saya"),
                buildSectionTitle("Pengaturan"),
                buildListTile("Pengaturan Notifikasi"),
                buildListTile("Pengaturan Privasi"),
                buildListTile(
                  "Bahasa / Language",
                  subtitle: "Bahasa Indonesia",
                ),
                buildSectionTitle("Bantuan"),
                buildListTile("Pusat Bantuan"),
                buildListTile("Kebijakan Bottlepay"),
                buildListTile("Ajukan Penghapusan Akun"),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan fungsi ganti akun
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF005F73),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Text(
                    "Ganti Akun",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan fungsi log out
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF005F73)),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF005F73),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Warna latar belakang navigasi
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF005F73),
          unselectedItemColor: const Color(0xFF9E9E9E),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "Tambah",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "Transaksi",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: const Color.fromARGB(255, 247, 241, 235), // Warna krem muda
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF005F73),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildListTile(String title, {String? subtitle}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9E9E9E),
              ),
            )
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xFF9E9E9E),
        size: 16,
      ),
      onTap: () {
        // Tambahkan navigasi untuk item
      },
    );
  }
}
