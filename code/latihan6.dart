import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Utama(),
    );
  }
}

// ---------- Halaman utama (punya navigasi bawah) ----------
class Utama extends StatefulWidget {
  const Utama({super.key});

  @override
  State<Utama> createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  int _index = 0; // tab yang sedang aktif

  // satu widget untuk setiap tab
  final List<Widget> _halaman = const [
    Center(child: Text('Halaman Beranda', style: TextStyle(fontSize: 24))),
    Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigasi Bawah')),
      body: _halaman[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}