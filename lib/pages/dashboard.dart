import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/components/bottom_nav.dart';
import 'package:last_project_pemograman_mobile/data/ktp_data.dart';
import 'package:last_project_pemograman_mobile/pages/user.dart';
import 'package:provider/provider.dart';
import '/pages/users.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<KTPData>(
      builder: (context, value, child) => Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245), // Warna latar belakang body
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
      body: Stack(
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
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 280),
              color: Color.fromARGB(255, 245, 245, 245), // Warna latar belakang body
              child: Column(
                children: [
                  // Bagian "History"
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                'Recents',
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
                        SingleChildScrollView(
                          child: SizedBox(
                            height: 300,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.getAllKTPS().length,
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Color(
                                              0xFFDAF6F7), // Warna latar belakang merah
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/img-default.png'), // Ganti dengan gambar Anda
                                          ),
                                        ),
                                      ),
                                      title: Text(value.getAllKTPS()[index].nama),
                                      subtitle: Text(value.getAllKTPS()[index].nik),
                                      trailing: Text(
                                                                    '${value.getWeekdayName(value.getAllKTPS()[index].dateTime)} ${value.getAllKTPS()[index].dateTime.day}/${value.getAllKTPS()[index].dateTime.month}/${value.getAllKTPS()[index].dateTime.year}'),
                          
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => UserPage(
                                                    data: value.getAllKTPS()[index],
                                                  )));
                                      },
                                    ),
                                  ),
                                );
                              },
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
                    const Row(
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
                            MaterialPageRoute(
                                builder: (context) => UsersPage()),
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
      bottomNavigationBar: BottomNav(),
    ),
    );
  }
}
