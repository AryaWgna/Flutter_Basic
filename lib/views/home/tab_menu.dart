import 'package:flutter/material.dart';
import 'side_menu.dart';

class TabMenu extends StatefulWidget {
  final int currentIndex;

  const TabMenu({super.key, required this.currentIndex});

  @override
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex; // Mengambil nilai currentIndex dari widget
  }

  // Fungsi untuk mengganti halaman berdasarkan pilihan tab atau side menu
  void switchTab(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // Menutup side menu setelah memilih
  }

  // Membuat konten halaman berdasarkan tab yang dipilih
  Widget _buildTabContent() {
    switch (_currentIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return _buildSchedulePage();
      case 2:
        return _buildProfilePage();
      default:
        return _buildHomePage();
    }
  }

  // Konten untuk Beranda: Berita tentang perkuliahan
  Widget _buildHomePage() {
    // Daftar berita perkuliahan
    final List<Map<String, String>> news = [
      {
        'title': 'Akademik dan Penelitian',
        'description': 'Pendaftaran semester, perubahan kurikulum, jadwal ujian.',
      },
      {
        'title': 'Kegiatan Mahasiswa',
        'description': 'Event, seminar, pelatihan, atau lomba yang diselenggrakan oleh organisasi.',
      },
      {
        'title': 'Beasiswa',
        'description': 'Informasi mengenai beasiswa baru untuk mahasiswa.',
      },
      {
        'title': 'Kebijakan Kampus',
        'description': 'Kebijakan terkait aturan akademik, administratif, atau kehidupan mahasiswa.',
      },
      {
        'title': 'Karir dan Alumni',
        'description': 'Pengumuman terkait job fair, pelatihan karir, dan peluang magang atau pekerjaan.',
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage('https://kuliahkelaskaryawan.org/wp-content/uploads/2023/10/UNBIN-680x437.jpg'), // Gambar lokal asset image
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Text(
                'Portal Berita Perkuliahan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: const [
                Text(
                  'Berita Kampus',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'Lihat Semua',
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              ],
            ),
          ),
          // Daftar berita perkuliahan
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.article, color: Colors.deepPurpleAccent),
                  title: Text(news[index]['title']!),
                  subtitle: Text(news[index]['description']!),
                  onTap: () {
                    // Navigasi ke detail berita
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Konten untuk Jadwal dengan lebih banyak data
  Widget _buildSchedulePage() {
    final List<Map<String, String>> schedule = [
      {'course': 'Kosong', 'time': 'Senin', 'room': '-'},
      {'course': 'Information Assurance and Security', 'time': 'Selasa, 14:00 - 16:30', 'room': 'Ruang Lab'},
      {'course': 'Numerical Methods', 'time': 'Rabu, 09:00 - 11:30', 'room': 'Ruang 2F'},
      {'course': 'Religious Studies', 'time': 'Rabu, 14:00 - 15:40', 'room': 'Ruang 2A'},
      {'course': 'Data MIning', 'time': 'Kamis, 14:00 - 16:30', 'room': 'Ruang 2A'},
      {'course': 'Research Methodology', 'time': 'Jumat, 08:30 - 11:00', 'room': 'Ruang 2A'},
      {'course': 'Mobile Programming', 'time': 'Jumat, 14:00 - 16:30', 'room': 'Ruang Lab'},
      {'course': 'Expert System', 'time': 'Sabtu, 11:00 - 13:30', 'room': 'Ruang 3A'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: schedule.length,
      itemBuilder: (context, index) {
        final item = schedule[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            leading: const Icon(Icons.book, color: Colors.deepPurpleAccent),
            title: Text(item['course']!),
            subtitle: Text('${item['time']} - ${item['room']}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigasi ke detail mata kuliah
            },
          ),
        );
      },
    );
  }

  // Konten untuk Profil
  Widget _buildProfilePage() {
    final String name = 'Arya Wiguna';
    final String email = 'wgnarya123@gmail.com';
    final String studentId = '12522010';

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://akademik.unbin.ac.id/foto/nophoto.png'), // Gambar lokal asset image 
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ID Mahasiswa: $studentId',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.deepPurpleAccent),
                title: Text(email),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.deepPurpleAccent),
              title: const Text('Pengaturan Akun'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke pengaturan akun
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.deepPurpleAccent),
              title: const Text('Ubah Kata Sandi'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke ubah kata sandi
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.deepPurpleAccent),
              title: const Text('Bantuan'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke halaman bantuan
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0
              ? 'Beranda'
              : _currentIndex == 1
                  ? 'Jadwal'
                  : 'Profil',
        ),
      ),
      drawer: SideMenu(switchTab: switchTab),
      body: _buildTabContent(),
      
      // Membungkus BottomNavigationBar dengan elemen berwarna
      bottomNavigationBar: Container(
        height: 70, // Tambahkan height untuk memastikan ruang cukup bagi BottomNavigationBar
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent, // Warna latar belakang untuk membungkus BottomNavigationBar
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Buat transparan untuk melihat warna dari Container
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Jadwal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
