import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  final double _contentWidth = 375.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: Center(
          child: Container(
            width: _contentWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBackButton(context),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                  child: Text(
                    'Notifikasi',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C5364),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      _buildNotificationTile(
                        title: "Jadwal Kuliah Hari Ini",
                        message:
                            "Pemrograman Visual, 9.30, (C205); Data Mining, 13.00, (C307).",
                      ),
                      _buildNotificationTile(
                        title: "Pengumuman",
                        message:
                            "Beasiswa untuk siswa berprestasi. Minimal mahasiswa semes...",
                      ),
                      _buildNotificationTile(
                        title: "Mental Health",
                        message:
                            "Beasiswa untuk siswa berprestasi. Minimal mahasiswa semes...",
                      ),
                      _buildNotificationTile(
                        title: "Akademik",
                        message:
                            "Beasiswa untuk siswa berprestasi. Minimal mahasiswa semes...",
                      ),
                      _buildNotificationTile(
                        title: "Keuangan",
                        message:
                            "Beasiswa untuk siswa berprestasi. Minimal mahasiswa semes...",
                      ),
                    ],
                  ),
                ),
              ],
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

  Widget _buildNotificationTile({required String title, required String message}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Text(
              "3",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
