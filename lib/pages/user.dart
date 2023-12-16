import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/components/bottom_nav.dart';
import 'package:last_project_pemograman_mobile/models/ktms.dart';

class UserPage extends StatelessWidget {
  final KTMs data;
  const UserPage({
    Key? key,
    required this.data,
  }) : super(key: key);

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
              // Gambar User
              Container(
                width: double.infinity, // Lebar penuh
                height: 300,
                child: Image.asset(
                  'assets/images/ktp-user.png', // Ganti dengan lokasi gambar Anda
                ),
              ),
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
                            'Detail User',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 700,
                      child: ListView(
                        children: [
                          DetailUserItem(
                              title: 'Alamat',
                              content:
                                  (data.alamat1 + data.alamat2 + data.alamat3)),
                          DetailUserItem(title: 'NIM', content: data.nim),
                          DetailUserItem(title: 'Nama', content: data.nama),
                          DetailUserItem(title: 'TTL', content: data.ttl),
                          DetailUserItem(title: 'Prodi', content: data.prodi),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class DetailUserItem extends StatelessWidget {
  final String title;
  final String content;

  const DetailUserItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          tileColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(content),
          onTap: () {
            // Aksi saat item di klik
          },
        ),
      ),
    );
  }
}
