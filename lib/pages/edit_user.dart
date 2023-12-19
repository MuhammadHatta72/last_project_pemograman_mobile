import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/components/bottom_nav.dart';
import 'package:last_project_pemograman_mobile/config/config.dart';
import 'package:last_project_pemograman_mobile/models/ktms.dart';
import 'package:http/http.dart' as http;
import 'package:last_project_pemograman_mobile/pages/users.dart';

class EditUserPage extends StatelessWidget {
  final KTMs data;
  EditUserPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final ttlController = TextEditingController();
  final prodiController = TextEditingController();
  final alamat1Controller = TextEditingController();
  final alamat2Controller = TextEditingController();
  final alamat3Controller = TextEditingController();

  // update data

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
                                      '${Config.BASE_URL}/images/' +
                                          data.nim +
                                          '.jpg',
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                EditInputUserItem(
                                    title: 'Nama',
                                    content: data.nama,
                                    controller: namaController),
                                EditInputUserItem(
                                    title: 'NIM',
                                    content: data.nim,
                                    controller: nimController),
                                EditInputUserItem(
                                    title: 'TTL',
                                    content: data.ttl,
                                    controller: ttlController),
                                EditInputUserItem(
                                    title: 'Prodi',
                                    content: data.prodi,
                                    controller: prodiController),
                                EditInputUserItem(
                                    title: 'Alamat 1',
                                    content: (data.alamat1),
                                    controller: alamat1Controller),
                                EditInputUserItem(
                                    title: 'Alamat 2',
                                    content: (data.alamat2),
                                    controller: alamat2Controller),
                                EditInputUserItem(
                                    title: 'Alamat 3',
                                    content: (data.alamat3),
                                    controller: alamat3Controller),

                                SizedBox(height: 20),
                                // Tombol simpan
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final url = Uri.parse(
                                            '${Config.BASE_URL}/update/${data.nim}');
                                        final response =
                                            await http.put(url, body: {
                                          "nim": nimController.text,
                                          "nama": namaController.text,
                                          "ttl": ttlController.text,
                                          "prodi": prodiController.text,
                                          "alamat1": alamat1Controller.text,
                                          "alamat2": alamat2Controller.text,
                                          "alamat3": alamat3Controller.text,
                                        }).then((value) => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        UsersPage())));
                                      },
                                      child: Text('Update Data',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          )),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                            0xFF79B3B7), // Warna latar belakang
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
  final TextEditingController controller;

  const EditInputUserItem({
    Key? key,
    required this.title,
    required this.content,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 8, 40, 0),
      child: TextField(
        decoration: InputDecoration(
          labelText: title,
        ),
        // add default value to TextField content
        controller: controller..text = content,
      ),
    );
  }
}
