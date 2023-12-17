import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/components/bottom_nav.dart';
import 'package:last_project_pemograman_mobile/data/ktm_data.dart';
import 'package:last_project_pemograman_mobile/pages/user.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                appBar: AppBar(
                  automaticallyImplyLeading: false, // Menghapus tombol kembali
                  backgroundColor:
                      Color(0xFF79B3B7), // Warna latar belakang AppBar
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
                  //           color: Color(
                  //               0xFFF7C92B), // Warna ikon notifikasi kuning
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
                  physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    color: Color(0xFFEAFFFD), // Warna latar belakang body
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Color(0xFF79B3B7), // Warna latar belakang
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(80.0),
                                  bottomRight: Radius.circular(80.0),
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Daftar KTM',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // IconButton(
                                    //   icon:
                                    //       Icon(Icons.sort, color: Colors.black),
                                    //   onPressed: () {
                                    //     // Aksi saat tombol sort by date ditekan
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 500,
                                child: ListView.builder(
                                  itemCount: value.getAllKTMS().length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                              borderRadius: BorderRadius.circular(8.0),
                                              // color: Color(0xFFDAF6F7), // Warna latar belakang merah
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://static-00.iconduck.com/assets.00/user-icon-2048x2048-ihoxz4vq.png',
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          title: Text(value.getAllKTMS()[index].nama),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                value.getAllKTMS()[index].nim,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                value.getAllKTMS()[index].prodi,
                                                style: TextStyle(
                                                  color: Color(0xFF79B3B7), // Warna teks hijau
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => UserPage(
                                                  data: value.getAllKTMS()[index],
                                                ),
                                              ),
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
                bottomNavigationBar: BottomNav(),
              ),
            );
          }
        });
  }
}
