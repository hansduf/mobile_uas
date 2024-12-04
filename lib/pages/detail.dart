import 'package:flutter/material.dart';


class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IbcTankPage(),
    );
  }
}

class IbcTankPage extends StatefulWidget {
  const IbcTankPage({super.key});

  @override
  State<IbcTankPage> createState() => _IbcTankPageState();
}

class _IbcTankPageState extends State<IbcTankPage> {
  int _currentIndex = 0;

  final List<String> _imageUrls = [
    'https://via.placeholder.com/300x200.png?text=Image+1',
    'https://via.placeholder.com/300x200.png?text=Image+2',
    'https://via.placeholder.com/300x200.png?text=Image+3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4), // Warna abu-abu muda
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Icon(Icons.arrow_back, color: Colors.black),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.search, color: Colors.black),
              const SizedBox(width: 8),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Geser
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    itemCount: _imageUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        _imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _imageUrls.map((url) {
                      int index = _imageUrls.indexOf(url);
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? const Color(0xFF257180)
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Nama dan Harga Produk
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IBC Tank Kempu 1000L',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp. 1.500.000,00',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Deskripsi Produk
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Deskripsi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                '• Alasan Jual:\n'
                '   - Bekas pemakaian proyek\n'
                '   - Masih layak pakai\n'
                '   - Efisiensi penyimpanan\n\n'
                '• Spesifikasi IBC Tank Kempu 1000L:\n'
                '   - Kapasitas: 1000 liter\n'
                '   - Material tangki: HDPE\n'
                '   - Dimensi: Panjang ±1200 mm, Lebar ±1000 mm, Tinggi ±1150 mm\n'
                '   - Berat kosong: Sekitar 55 kg\n'
                '   - Kondisi: Bekas, namun layak pakai\n',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi untuk tombol "Hubungi Penjual"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF257180), // Hijau tua
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Hubungi Penjual',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi untuk tombol "Beli"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00395F), // Biru tua
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Beli',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
