import 'package:flutter/material.dart';
import '/pages/dashboard.dart';
import '/pages/users.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFEAFFFD), // Warna latar belakang body
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF79B3B7), // Warna latar belakang
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 22, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Scan KTP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Fungsi untuk mengambil gambar
                    //     // Tambahkan kode untuk ambil gambar di sini
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 200, // Tentukan tinggi kotak ambil gambar
                    //     margin: EdgeInsets.symmetric(horizontal: 40),
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black), // Contoh border hitam
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         'Klik untuk ambil gambar',
                    //         style: TextStyle(fontSize: 16),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Gambar User
                    Container(
                      width: double.infinity, // Lebar penuh
                      child: Image.asset(
                        'assets/images/img-scan.png', // Ganti dengan lokasi gambar Anda
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30), // Menambahkan margin horizontal
                        child: ElevatedButton(
                          onPressed: () {
                            // Fungsi untuk tombol di bawahnya
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF5C3D)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // Mengubah warna teks menjadi putih
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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