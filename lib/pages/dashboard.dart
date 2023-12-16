import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/components/bottom_nav.dart';
import 'package:last_project_pemograman_mobile/data/ktm_data.dart';
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
    // wait for data to be fetched
    // to do this, we use FutureBuilder
    return FutureBuilder(
        future: Provider.of<KTMData>(context, listen: false).fetchKTMs(),
        builder: (context, snapshot) {
          // if data is not fetched yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // if data is fetched
          else {
            return Consumer<KTMData>(
              builder: (context, value, child) => Scaffold(
                backgroundColor: const Color.fromARGB(
                    255, 245, 245, 245), // Warna latar belakang body
                appBar: AppBar(
                  automaticallyImplyLeading: false, // Menghapus tombol kembali
                  backgroundColor:
                      const Color(0xFF79B3B7), // Warna latar belakang AppBar
                  title: const Row(
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
                          icon: const Icon(
                            Icons.notifications,
                            color: Color(
                                0xFFF7C92B), // Warna ikon notifikasi kuning
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
                  // set scroll to false
                  physics: const NeverScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF79B3B7), // Warna latar belakang
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                              ),
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                            child: const Column(
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
                                  'Selamat Datang di Aplikasi Scan KTM', // Paragraf selamat datang
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
                        margin: const EdgeInsets.only(top: 280),
                        color: const Color.fromARGB(
                            255, 245, 245, 245), // Warna latar belakang body
                        child: Column(
                          children: [
                            // Bagian "History"
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Recents',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.sort,
                                              color: Colors.black),
                                          onPressed: () {
                                            // Aksi saat tombol sort by date ditekan
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: SingleChildScrollView(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: value.getAllKTMS().length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: ListTile(
                                                tileColor: Colors.white,
                                                leading: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: const Color(
                                                        0xFFDAF6F7), // Warna latar belakang merah
                                                    image:
                                                        const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/img-default.png'), // Ganti dengan gambar Anda
                                                    ),
                                                  ),
                                                ),
                                                title: Text(value
                                                    .getAllKTMS()[index]
                                                    .nama),
                                                subtitle: Text(value
                                                    .getAllKTMS()[index]
                                                    .nim),
                                                trailing: Text(
                                                  value
                                                      .getAllKTMS()[index]
                                                      .prodi,
                                                  style: const TextStyle(
                                                    color: Color(
                                                        0xFF79B3B7), // Warna teks hijau
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              UserPage(
                                                                data: value
                                                                        .getAllKTMS()[
                                                                    index],
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
                      Positioned(
                        top: 110, // Ubah sesuai keinginan Anda
                        left: 20,
                        right: 20,
                        child: Card(
                          elevation: 3,
                          color:
                              Colors.white, // Background warna putih pada card
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          // Jumlah KTM di database
                                          value.getAllKTMS().length.toString(),
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'Jumlah KTM',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UsersPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF5C3D),
                                    ),
                                    child: const Text(
                                      'Daftar KTM',
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Warna teks putih pada tombol
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
                bottomNavigationBar: const BottomNav(),
              ),
            );
          }
        });
  }
}
