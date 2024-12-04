import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.search, color: Colors.grey),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Bagian Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/profile_image.png'), // Ganti dengan gambar Anda
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Menarik Perhatian",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Dapatkan pengalaman seru mencari harta karun sambil bertemu dengan penjual dan pembeli lainnya, cocok untuk bersosialisasi!",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Bagian Kategori
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kategori",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem(Icons.shopping_bag, "Fashion"),
                  _buildCategoryItem(Icons.tv, "Electronic"),
                  _buildCategoryItem(Icons.toys, "Mainan"),
                  _buildCategoryItem(Icons.watch, "Aksesoris"),
                  _buildCategoryItem(Icons.history_edu, "Antik"),
                ],
              ),
              const SizedBox(height: 24),

              // Bagian Gratis Ongkir
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gratis Ongkir",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              _buildHorizontalProductList([
                {
                  "name": "Produk 1",
                  "price": "Rp 150.000",
                  "image": "https://via.placeholder.com/150"
                },
                {
                  "name": "Produk 2",
                  "price": "Rp 200.000",
                  "image": "https://via.placeholder.com/150"
                },
                {
                  "name": "Produk 3",
                  "price": "Rp 250.000",
                  "image": "https://via.placeholder.com/150"
                },
              ]),
              const SizedBox(height: 24),

              // Bagian Postingan Terbaru
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Postingan Terbaru",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              _buildHorizontalProductList([
                {
                  "name": "Posting 1",
                  "price": "Rp 300.000",
                  "image": "https://via.placeholder.com/150"
                },
                {
                  "name": "Posting 2",
                  "price": "Rp 400.000",
                  "image": "https://via.placeholder.com/150"
                },
                {
                  "name": "Posting 3",
                  "price": "Rp 500.000",
                  "image": "https://via.placeholder.com/150"
                },
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
  decoration: const BoxDecoration(
    color: Colors.white,
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
    onTap: (index) {
      if (index == 1) {
        // Navigasi ke halaman Wishlist
        Navigator.pushNamed(context, '/wishlist');
      }else if (index == 2) {
        // Navigasi ke halaman Tambah Item
        Navigator.pushNamed(context, '/tambah');
      }
    },
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

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.grey[700]),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildHorizontalProductList(List<Map<String, String>> products) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(
            product["name"]!,
            product["price"]!,
            product["image"]!,
          );
        },
      ),
    );
  }

  Widget _buildProductCard(String name, String price, String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 14, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
