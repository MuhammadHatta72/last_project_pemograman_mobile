import 'package:flutter/material.dart';
import '/pages/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: <Color> [
          Color(0xFF79B3B7),
        ].first,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Polinema Parking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Amankan kendaraan dan barang Anda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF5C3D),
                ),
                child: Text(
                  'Mulai Sekarang',
                  style: TextStyle(
                    color: Colors.white, // Warna teks diatur di sini
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}