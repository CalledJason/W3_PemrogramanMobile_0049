
import 'package:flutter/material.dart';

void main() {
  runApp(const JasonStoreApp());
}


class JasonStoreApp extends StatelessWidget {
  const JasonStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JasonStore',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF4F0E6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF5D928),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}


class Product {
  String name;
  String category;
  String description;
  int price;
  String image;

  Product({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
  });
}

List<Product> products = [
  Product(
    name: 'Urban Headphone',
    category: 'AUDIO EQUIPMENT',
    description: 'Headphone modern dengan desain minimalis '
        'untuk menemani aktivitas sehari-hari.',
    price: 750000,
    image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
  ),
  Product(
    name: 'Street Sneakers',
    category: 'FOOTWEAR',
    description: 'Sneakers bergaya streetwear dengan '
        'desain kasual dan nyaman digunakan.',
    price: 1200000,
    image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
  ),
  Product(
    name: 'Digital Camera',
    category: 'ELECTRONICS',
    description: 'Kamera digital untuk mengabadikan '
        'berbagai momen dengan gaya.',
    price: 3500000,
    image: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=600',
  ),
];


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: const Color(0xFF17191D),
        selectedItemColor: const Color(0xFFF5D928),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF17191D),
        foregroundColor: Colors.white,
        title: const Text(
          'JASONSTORE.',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5D928),
                  border: Border.all(
                    color: const Color(0xFF17191D),
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'NEW ERIDU / 001',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'DISCOVER\nYOUR GEAR.',
                      style: TextStyle(
                        fontSize: 36,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF17191D),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'YOUR DAILY ESSENTIALS START HERE.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF17191D),
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: const Text('EXPLORE PRODUCTS →'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'FEATURED ITEMS',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF17191D),
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'SELECTED GOODS / VOL. 001',
                style: TextStyle(fontSize: 11),
              ),

              const SizedBox(height: 15),

              ProductCard(product: products[0]),

              const SizedBox(height: 20),

              ProductCard(product: products[1]),

              const SizedBox(height: 20),

              ProductCard(product: products[2]),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF17191D),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(),
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('ABOUT JASONSTORE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: product,
            ),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF17191D),
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF17191D),
              offset: Offset(4, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 170,
                  color: const Color(0xFFA7A9A6),
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFD94B3D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp ${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRODUCT ARCHIVE',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: const Color(0xFF17191D),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FIND YOUR\nNEXT GEAR.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                height: 1,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),
              color: const Color(0xFFF5D928),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text('BROWSE ALL ITEMS'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ProductCard(
                      product: products[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITEM DETAILS'),
        backgroundColor: const Color(0xFF17191D),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                color: const Color(0xFFF5D928),
                child: Text(
                  product.category,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Rp ${product.price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD94B3D),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'PRODUCT DESCRIPTION',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                product.description,
                style: const TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF17191D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('BACK TO CATALOG'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGENT PROFILE'),
        backgroundColor: const Color(0xFF17191D),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              color: const Color(0xFFF5D928),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFF17191D),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'GUEST AGENT',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  Text('JASONSTORE MEMBER / 001'),
                ],
              ),
            ),

            const SizedBox(height: 25),

            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About JasonStore'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),

            const Divider(color: Colors.black),

            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Explore Products'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT JASONSTORE'),
        backgroundColor: const Color(0xFF17191D),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'JASON\nSTORE.',
              style: TextStyle(
                fontSize: 55,
                height: 1,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(15),
              color: const Color(0xFFF5D928),
              child: const Text(
                'URBAN GEAR ARCHIVE / EST. 2026',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'ABOUT US',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'JasonStore merupakan aplikasi katalog '
                  'produk sederhana yang menyediakan '
                  'berbagai perlengkapan dan kebutuhan '
                  'dengan gaya urban modern.',

              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF17191D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('BACK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
