import 'package:flutter/material.dart';
// Impor halaman ProductView
import 'package:appbaru/app/modules/home/views/product.dart';
import 'package:appbaru/app/modules/home/views/profile.dart';
import 'package:appbaru/app/modules/home/views/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Products',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Category Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton(
                    'Hats', 'assets/img/topi.png', Color(0xFFEBBC80), context),
                _buildCategoryButtonClothes('Clothes', 'assets/img/clotes.png',
                    Color(0xFFB6CDF5), context),
                _buildCategoryButton(
                    'Bags', 'assets/img/bags.png', Color(0xFFAEF1D0), context),
                _buildCategoryButton('Jeans', 'assets/img/jeans.png',
                    Color(0xFFF6C5FF), context),
              ],
            ),
            SizedBox(height: 20),
            // Title
            Text(
              'Casual\nCollections',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // Image Stack
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/img/korean.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Bottom Navigation Bar
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), // Ikon lonceng pemberitahuan
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      Icon(Icons.shopping_cart),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 12, minHeight: 12),
                          child: Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
              onTap: (index) {
                // Navigasi menggunakan Navigator.push
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Tombol Kategori Default
  Widget _buildCategoryButton(String label, String imagePath,
      Color backgroundColor, BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  // Tombol Kategori Clothes yang Memiliki Navigasi ke ProductView
  Widget _buildCategoryButtonClothes(String label, String imagePath,
      Color backgroundColor, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Pindah ke ProductView ketika kategori Clothes ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}
