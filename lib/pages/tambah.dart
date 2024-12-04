import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';

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
        scaffoldBackgroundColor: const Color(0xFFFDF4EC),
        primaryColor: const Color(0xFF257180), // Warna utama
      ),
      home: const TambahBarangPage(),
    );
  }
}

class TambahBarangPage extends StatefulWidget {
  const TambahBarangPage({super.key});

  @override
  _TambahBarangPageState createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  List<String> selectedCategories = []; // Menyimpan kategori yang dipilih
  final ImagePicker _picker = ImagePicker(); // Instance ImagePicker

  // Fungsi untuk memilih gambar
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Logika untuk menyimpan atau menampilkan gambar
      print('Gambar terpilih: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () {},
        ),
        title: const Text(
          'Tambah barang',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // UI untuk foto barang dan deskripsi
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tambahkan Foto atau Video (maksimal 3)',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const _InputField(label: 'Nama Barang'),
            const SizedBox(height: 20),
            const _InputField(label: 'Tambah Deskripsi dan Kondisi', isTextArea: true),
            const SizedBox(height: 20),
            const _InputField(label: 'Masukkan Harga'),
            const SizedBox(height: 20),
            const _CategoryField(), // Kategori
            const SizedBox(height: 20),
            // Menampilkan kategori yang sudah dipilih
            _SelectedCategories(
              selectedCategories: selectedCategories,
              onCategoryDeleted: (category) {
                setState(() {
                  selectedCategories.remove(category);
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                  // Pindah ke halaman utama (home)
                  Navigator.pushReplacementNamed(context, '/Homepage');},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'KONFIRMASI',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final bool isTextArea;

  const _InputField({required this.label, this.isTextArea = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          maxLines: isTextArea ? 5 : 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryField extends StatelessWidget {
  const _CategoryField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tambah Kategori',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        TypeAheadField<String>(
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          suggestionsCallback: (pattern) {
            return _getCategorySuggestions(pattern);
          },
          itemBuilder: (context, String suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          onSuggestionSelected: (String suggestion) {
            // Menangani saat kategori dipilih
            // Menggunakan setState untuk memperbarui selectedCategories
            final state = context.findAncestorStateOfType<_TambahBarangPageState>();
            state?.setState(() {
              state.selectedCategories.add(suggestion);
            });
          },
        ),
      ],
    );
  }

  List<String> _getCategorySuggestions(String query) {
    const categories = ['Fashion', 'Electric', 'Mainan', 'Aksesoris', 'Antik'];
    return categories
        .where((category) => category.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

class _SelectedCategories extends StatelessWidget {
  final List<String> selectedCategories;
  final Function(String) onCategoryDeleted;

  const _SelectedCategories({
    required this.selectedCategories,
    required this.onCategoryDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategori yang dipilih:',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        // Menampilkan kategori yang sudah dipilih
        Wrap(
          spacing: 8.0,
          children: selectedCategories
              .map((category) => Chip(
                    label: Text(category),
                    backgroundColor: const Color(0xFF257180), // Warna kategori yang dipilih
                    deleteIcon: const Icon(Icons.clear, size: 18),
                    onDeleted: () {
                      onCategoryDeleted(category);  // Memanggil fungsi untuk menghapus kategori
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}
