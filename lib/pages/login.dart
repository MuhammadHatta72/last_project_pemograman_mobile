import 'package:flutter/material.dart';
import '/pages/register.dart';
import '/pages/dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/img-login.png',
                    width: 350,
                    height: 350,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF79B3B7),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Please Sign in to continue',
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

              // ElevatedButton
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF5C3D),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 10), // Spasi sebelum paragraf

              // Teks untuk pindah ke halaman register
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Have an account? Sign Up',
                    style: TextStyle(
                      color: Color(0xFF79B3B7),
                      // decoration: TextDecoration.underline,
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
