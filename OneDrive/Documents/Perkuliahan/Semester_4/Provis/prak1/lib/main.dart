import 'package:flutter/material.dart';
import 'screens/medsos.dart';
import 'screens/mental_health.dart';
import 'screens/akademik.dart';
import 'screens/keuangan.dart';
import 'screens/elearning.dart';
import 'screens/jadwal.dart';
import 'screens/pesan.dart';
import 'screens/notifikasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi 8 Tombol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// MainScreen langsung menjadi bagian dari file main.dart
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar menu yang akan ditampilkan
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Medsos',
        'icon': Icons.public,
        'color': Colors.indigo.shade200,
      },
      {
        'title': 'Mental Health',
        'icon': Icons.favorite,
        'color': Colors.indigo.shade200,
      },
      {
        'title': 'Akademik',
        'icon': Icons.school,
        'color': Colors.indigo.shade200,
      },
      {
        'title': 'Keuangan',
        'icon': Icons.account_balance_wallet,
        'color': Colors.indigo.shade200,
      },
      {
        'title': 'E-Learning',
        'icon': Icons.book,
        'color': Colors.indigo.shade200,
      },
      {
        'title': 'Jadwal & Todo',
        'icon': Icons.calendar_today,
        'color': Colors.indigo.shade200,
      },
      {
        'title': 'Pesan & Group',
        'icon': Icons.message,
        'color': Colors.indigo.shade200,
      },
      {
        'title': 'Notifikasi',
        'icon': Icons.notifications,
        'color': Colors.indigo.shade200,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('kuis 1 kelompok 23'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey.shade100,
        child: Center(
          child: Container(
            width: 350, // Lebar tetap 350 pixel
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, left: 24.0, right: 24.0),
                    child: _buildMenuButton(
                      context,
                      menuItems[index]['title'],
                      menuItems[index]['icon'],
                      menuItems[index]['color'],
                      () => _navigateToPage(context, menuItems[index]['title']),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(28.0),
        child: Container(
          height: 56.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24.0,
                color: Colors.indigo.shade400,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String pageName) {
    Widget page;
    
    switch(pageName) {
      case 'Medsos':
        page = MedsosScreen();
        break;
      case 'Mental Health':
        page = MentalHealthScreen();
        break;
      case 'Akademik':
        page = AkademikScreen();
        break;
      case 'Keuangan':
        page = KeuanganScreen();
        break;
      case 'E-Learning':
        page = ELearningScreen();
        break;
      case 'Jadwal & Todo':
        page = JadwalTodoScreen();
        break;
      case 'Pesan & Group':
        page = PesanGroupScreen();
        break;
      case 'Notifikasi':
        page = NotifikasiScreen();
        break;
      default:
        page = const MainScreen();
    }
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}