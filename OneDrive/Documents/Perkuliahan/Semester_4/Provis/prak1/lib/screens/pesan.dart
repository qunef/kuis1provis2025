import 'package:flutter/material.dart';

class PesanGroupScreen extends StatelessWidget {
  const PesanGroupScreen({Key? key}) : super(key: key);

  final double _contentWidth = 375.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: Center(
          child: Container(
            width: _contentWidth,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackButton(context),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                    child: Text(
                      'Pesan & Grup',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C5364),
                      ),
                    ),
                  ),
                  _buildCard("Pesan Pribadi", [
                    "Dosen A: Harap upload tugas minggu ini ya.",
                    "Teman B: Yuk kerja kelompok jam 3.",
                  ]),
                  _buildCard("Grup Kelas", [
                    "TI-4A: Ujian Kecerdasan Buatan minggu depan.",
                    "Praktikum: Cek jadwal ganti hari lab.",
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2C5364)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...items.map((e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 14)),
                    Expanded(child: Text(e, style: const TextStyle(fontSize: 14))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
