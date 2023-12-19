import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/components/bottom_nav.dart';
import 'package:last_project_pemograman_mobile/models/ktms.dart';

class EditUserPage extends StatelessWidget {
  final KTMs data;
  const EditUserPage({
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
        // actions: [
        //   Tooltip(
        //     message: 'Notifikasi', // Informasi tambahan saat dihover
        //     child: Card(
        //       elevation: 3,
        //       color: Colors.white,
        //       child: IconButton(
        //         icon: Icon(
        //           Icons.notifications,
        //           color: Color(0xFFF7C92B), // Warna ikon notifikasi kuning
        //         ), // Icon notifikasi
        //         onPressed: () {
        //           // Aksi saat icon notifikasi diklik
        //         },
        //       ),
        //     ),
        //   ),
        // ],
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

              SizedBox(height: 20), // Spasi sebelum paragraf

              // Gambar User
              // Container(
              //   width: double.infinity, // Lebar penuh
              //   height: 300,
              //   child: Image.asset(
              //     'assets/images/ktp-user.png', // Ganti dengan lokasi gambar Anda
              //   ),
              // ),
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
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Edit User',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // IconButton(
                                //   icon:
                                //   Icon(Icons.sort, color: Colors.black),
                                //   onPressed: () {
                                //     // Aksi saat tombol sort by date ditekan
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 500,
                            child: ListView(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 100.0),
                                    child: Image.network(
                                      'http://192.168.18.69:5000/images/' +
                                          data.nim +
                                          '.jpg',
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                EditInputUserItem(
                                    title: 'Nama', content: data.nama),
                                EditInputUserItem(title: 'NIM', content: data.nim),
                                EditInputUserItem(title: 'TTL', content: data.ttl),
                                EditInputUserItem(
                                    title: 'Prodi', content: data.prodi),
                                EditInputUserItem(
                                    title: 'Alamat 1',
                                    content: (data.alamat1)),
                                EditInputUserItem(
                                    title: 'Alamat 2',
                                    content: (data.alamat2)),
                                EditInputUserItem(
                                    title: 'Alamat 3',
                                    content: (data.alamat3)),

                                SizedBox(height: 20),
                                // Tombol simpan
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Aksi saat tombol simpan ditekan
                                      },
                                      child: Text(
                                          'Update Data',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          )
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF79B3B7), // Warna latar belakang
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
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

class EditInputUserItem extends StatelessWidget {
  final String title;
  final String content;

  const EditInputUserItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 8, 40, 0),
      // child: Card(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10.0),
      //   ),
      //   child: ListTile(
      //     tileColor: Colors.white,
      //     title: Text(
      //       title,
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     subtitle: Text(content),
      //     onTap: () {
      //       // Aksi saat item di klik
      //     },
      //   ),
      // ),

      // ubah jadi input yang bisa diganti
      child: TextField(
        decoration: InputDecoration(
          // border: OutlineInputBorder(),
          labelText: title,
        ),
        controller: TextEditingController(text: content),
      ),
    );
  }
}
