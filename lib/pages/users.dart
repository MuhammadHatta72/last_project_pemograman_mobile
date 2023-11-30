import 'package:flutter/material.dart';
import '/pages/user.dart';
import '/pages/scan.dart';
import '/pages/dashboard.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

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
              SizedBox(height: 60),
              // Bagian "History"
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
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daftar KTP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.sort, color: Colors.black),
                            onPressed: () {
                              // Aksi saat tombol sort by date ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 450,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                tileColor: Colors.white,
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Color(0xFFDAF6F7), // Warna latar belakang merah
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/img-default.png'), // Ganti dengan gambar Anda
                                    ),
                                  ),
                                ),
                                title: Text('Name $index'),
                                subtitle: Text('Description $index'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => UserPage()),
                                  );
                                },
                              ),
                            ),
                          );
                        },
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
