import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Beranda(),
        '/detail': (context) => const Detail(),
      },
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
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: 'Rangga',
            );
          },
          child: const Text('Lihat detail Rangga'),
        ),
      ),
    );
  }
}

// ---------- Halaman penerima ----------
class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final nama =
    ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(nama)),
      body: Center(
        child: Text('Halo, $nama!', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}