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

// ---------- Halaman pertama (penerima hasil) ----------
class Beranda extends StatelessWidget {
  const Beranda({super.key});

  Future<void> pilih(BuildContext context) async {
    final hasil = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => const HalamanPilih(),
      ),
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dipilih: $hasil')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => pilih(context),
          child: const Text('Pilih program studi'),
        ),
      ),
    );
  }
}

// ---------- Halaman kedua (pengirim hasil) ----------
class HalamanPilih extends StatelessWidget {
  const HalamanPilih({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Prodi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'IF'),
              child: const Text('Pilih Informatika'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'SI'),
              child: const Text('Pilih Sistem Informasi'),
            ),
          ],
        ),
      ),
    );
  }
}