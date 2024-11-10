import 'package:flutter/material.dart';
import 'package:appbaru/app/modules/home/controllers/welcome_controller.dart';
//import 'homepage.dart'; // Import HomePage

class WelcomeScreen extends StatelessWidget {
  final WelcomeController controller = WelcomeController(); // Buat instance controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              // Bagian gambar
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage('assets/img/img1.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage('assets/img/img2.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 310,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          image: AssetImage('assets/img/img3.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Bagian teks utama
              Text(
                'Aplikasi Fashion yang Membuat Anda Tampil Terbaik',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Temukan dunia fashion yang disesuaikan untuk Anda. Tingkatkan gaya Anda dengan mudah melalui tampilan yang dikurasi dan tren terbaru.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 40),
              // Tombol utama untuk navigasi
              ElevatedButton(
                onPressed: () {
                  controller.navigateToNextScreen(context); // Gunakan controller untuk navigasi
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Ayo Mulai',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Teks untuk sign in
              TextButton(
                onPressed: () {
                  controller.signIn(context); // Gunakan controller untuk sign-in
                },
                child: Text(
                  'Sudah punya akun? Masuk',
                  style: TextStyle(
                    color: Colors.brown,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}