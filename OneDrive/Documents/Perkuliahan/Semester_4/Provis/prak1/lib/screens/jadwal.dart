import 'package:flutter/material.dart';

class JadwalTodoScreen extends StatelessWidget {
  const JadwalTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBackButton(context),
                const SizedBox(height: 16),
                const Text(
                  'Jadwal & Todo List',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C5364),
                  ),
                ),
                const SizedBox(height: 24),
                _buildCardSection(
                  title: 'Jadwal Kuliah Hari Ini',
                  items: const [
                    '• Pemrograman Visual, 9.30, (C205)',
                    '• Data Mining, 13.00, (C307)',
                  ],
                ),
                const SizedBox(height: 16),
                _buildCardSection(
                  title: 'Todo List',
                  items: const [
                    '• Tubes 1 Provis (Besok, 19.00)',
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Buat Tugas Baru',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C5364),
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField('tulis judul'),
                const SizedBox(height: 12),
                _buildTextField('tulis tanggal deadline'),
                const SizedBox(height: 20),
                _buildAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Color(0xFF2C5364)),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildCardSection({required String title, required List<String> items}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF2C5364),
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((text) => Text(text)).toList(),
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Center(
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF5A9BD5),
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: const Center(
          child: Text(
            'Tambah baru',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
