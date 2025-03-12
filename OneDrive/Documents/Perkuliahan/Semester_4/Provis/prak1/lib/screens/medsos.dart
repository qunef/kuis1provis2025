import 'package:flutter/material.dart';

class MedsosScreen extends StatefulWidget {
  const MedsosScreen({Key? key}) : super(key: key);

  @override
  State<MedsosScreen> createState() => _MedsosScreenState();
}

class _MedsosScreenState extends State<MedsosScreen> {
  final double _contentWidth = 450.0;

  final List<Map<String, dynamic>> _feeds = [
    {
      'user': 'Aulia',
      'type': 'Foto',
      'content': 'Mengikuti seminar teknologi AI di kampus hari ini!',
      'image': 'assets/images/ai_event.jpg',
    },
    {
      'user': 'Bimo',
      'type': 'Video',
      'content': 'Lomba dance antar fakultas seru banget!',
      'image': 'assets/images/dance_event.jpg',
    },
    {
      'user': 'Citra',
      'type': 'Story',
      'content': 'Story ku saat persiapan sidang skripsi. Wish me luck!',
      'image': 'assets/images/story_sidang.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6EF),
      body: SafeArea(
        child: Center(
          child: Container(
            width: _contentWidth,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildPostOptions(),
                  _buildStudentPosts(),
                  _buildBottomNavigation(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.person, color: Color(0xFFD8DD7D)),
              ),
              const SizedBox(width: 12),
              const Text(
                'Hallo, User!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Color(0xFFD8DD7D)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostOptions() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bagikan Sesuatu',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPostOption(Icons.photo, 'Foto'),
              _buildPostOption(Icons.videocam, 'Video'),
              _buildPostOption(Icons.auto_stories, 'Story'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPostOption(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 30, color: Color(0xFFD8DD7D)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF5FA2BB))),
      ],
    );
  }

  Widget _buildStudentPosts() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Post Mahasiswa',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (var feed in _feeds) _buildFeedItem(feed),
        ],
      ),
    );
  }

  Widget _buildFeedItem(Map<String, dynamic> feed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFD8DD7D),
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(feed['user']),
            subtitle: Text(feed['type']),
            trailing: const Icon(Icons.more_vert),
          ),
          if (feed['image'] != null)
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(feed['image']),
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(feed['content']),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF5FA2BB),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.group, 'Medsos', true),
          _buildNavItem(Icons.lightbulb_outline, 'E-Learning', false),
          _buildNavItem(Icons.chat_bubble_outline, 'Chat & Group', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? Color(0xFFD8DD7D) : Color(0xFFF6F6EF)),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Color(0xFFD8DD7D) : Color(0xFFF6F6EF),
          ),
        ),
      ],
    );
  }
}
