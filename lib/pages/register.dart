import 'package:flutter/material.dart';
import '/pages/login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/img-register.png',
                    width: 350,
                    height: 350,
                  ),
                ],
              ),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF79B3B7),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Please Sign Up to register',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF79B3B7),
                ),
              ),
              SizedBox(height: 20),

              // TextFormField for Username
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Color(0xFFDEF2F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),

              // TextFormField for Password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Color(0xFFDEF2F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),

              // TextFormField for Confirm Password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Color(0xFFDEF2F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),

              // ElevatedButton
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Your registration function here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF5C3D),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 10), // Spasi sebelum paragraf

              // Teks untuk pindah ke halaman login
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Have an account? Sign In',
                    style: TextStyle(
                      color: Color(0xFF79B3B7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}