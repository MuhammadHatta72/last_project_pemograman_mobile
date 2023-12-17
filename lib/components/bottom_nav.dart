import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/pages/camera_page.dart';
import 'package:last_project_pemograman_mobile/pages/dashboard.dart';
import 'package:last_project_pemograman_mobile/pages/users.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(
                    255, 245, 245, 245),
      child: Container(
        decoration: BoxDecoration(
          color: Colors
              .white, // Ubah latar belakang bottom navigation bar menjadi putih
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD9D9D9)
                  .withOpacity(0.6), // Warna shadow dengan opasitas 60%
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3), // Atur offset shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15.0), // Radius sudut keseluruhan
        ),
        padding: EdgeInsets.only(top: 8, bottom: 8),
        margin: EdgeInsets.only(
            bottom: 15, left: 20, right: 20), // Atur margin bawah menjadi 15
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home,
                  color: Color(0xFFD9D9D9)), // Icon home dengan warna abu-abu
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(
                    0xFFFF5C3D), // Background warna merah pada tombol tengah
                borderRadius:
                    BorderRadius.circular(10.0), // Radius sudut tombol tengah
              ),
              child: TextButton(
                onPressed: () async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CameraPage(cameras: value))));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/img-button-nav.png',
                        width: 30, height: 30), // Ganti dengan gambar Anda
                    SizedBox(width: 4),
                    Text(
                      'SCAN',
                      style: TextStyle(
                          color: Colors
                              .white), // Warna tulisan putih pada tombol tengah
                    ), // Text tombol tengah
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.payment,
                  color: Color(0xFFD9D9D9)), // Icon payment dengan warna abu-abu
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
