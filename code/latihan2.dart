import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Beranda(),
    );
  }
}

// ---------- Halaman pengirim ----------
class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HalamanDetail(nama: 'Rangga'),
              ),
            );
          },
          child: const Text('Lihat detail Rangga'),
        ),
      ),
    );
  }
}

// ---------- Halaman penerima ----------
class HalamanDetail extends StatelessWidget {
  final String nama;
  const HalamanDetail({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nama)),
      body: Center(child: Text('Detail $nama')),
    );
  }
}