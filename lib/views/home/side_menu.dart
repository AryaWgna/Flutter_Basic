import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final Function(int) switchTab; // Fungsi untuk mengganti tab

  const SideMenu({super.key, required this.switchTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
            child: Text(
              'Menu Navigasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () {
              switchTab(0); // Pindah ke tab Beranda
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Jadwal'),
            onTap: () {
              switchTab(1); // Pindah ke tab Jadwal
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
            onTap: () {
              switchTab(2); // Pindah ke tab Profil
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Keluar'),
            onTap: () {
             Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
              // Ganti '/login' dengan nama route yang sesuai untuk halaman login              // Implementasi logout atau navigasi ke halaman login
            },
          ),
        ],
      ),
    );
  }
}
