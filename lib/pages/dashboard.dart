import 'package:flutter/material.dart';
import '/pages/users.dart';
import '/pages/scan.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghapus tombol kembali
        backgroundColor: Color(0xFF79B3B7), // Warna latar belakang AppBar
        title: Row(
          children: [
            Icon(
              Icons.home,
              color: Colors.white, // Warna ikon home putih
            ), // Ganti ikon menjadi home
            SizedBox(width: 10),
            Text(
              'Polinema Parking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks
              ),
            ),
          ],
        ),
        actions: [
          Tooltip(
            message: 'Notifikasi', // Informasi tambahan saat dihover
            child: Card(
              elevation: 3,
              color: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Color(0xFFF7C92B), // Warna ikon notifikasi kuning
                ), // Icon notifikasi
                onPressed: () {
                  // Aksi saat icon notifikasi diklik
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF79B3B7), // Warna latar belakang
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello Aido', // Tulisan Hello Aido
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Warna teks
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Selamat Datang di Aplikasi Scan KTP', // Paragraf selamat datang
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Warna teks
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 110, // Ubah sesuai keinginan Anda
              left: 20,
              right: 20,
              child: Card(
                elevation: 3,
                color: Colors.white, // Background warna putih pada card
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '100', // Jumlah KTP
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Jumlah KTP',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '80', // KTP masuk
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'KTP Masuk',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '20', // KTP keluar
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'KTP Keluar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UsersPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF5C3D),
                          ),
                          child: Text(
                            'Daftar KTP',
                            style: TextStyle(
                              color: Colors.white, // Warna teks putih pada tombol
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Ubah latar belakang bottom navigation bar menjadi putih
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD9D9D9).withOpacity(0.6), // Warna shadow dengan opasitas 60%
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3), // Atur offset shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15.0), // Radius sudut keseluruhan
        ),
        padding: EdgeInsets.only(top: 8, bottom: 8),
        margin: EdgeInsets.only(bottom: 15, left: 20, right: 20), // Atur margin bawah menjadi 15
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Color(0xFFD9D9D9)), // Icon home dengan warna abu-abu
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFF5C3D), // Background warna merah pada tombol tengah
                borderRadius: BorderRadius.circular(10.0), // Radius sudut tombol tengah
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanPage()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/img-button-nav.png', width: 30, height: 30), // Ganti dengan gambar Anda
                    SizedBox(width: 4),
                    Text(
                      'SCAN',
                      style: TextStyle(color: Colors.white), // Warna tulisan putih pada tombol tengah
                    ), // Text tombol tengah
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.payment, color: Color(0xFFD9D9D9)), // Icon payment dengan warna abu-abu
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsersPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
