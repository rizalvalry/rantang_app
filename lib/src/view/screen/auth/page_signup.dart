import 'package:flutter/material.dart';

class PageSignUp extends StatefulWidget {
  const PageSignUp({Key? key}) : super(key: key);

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController hpController = TextEditingController();

  Future<void> _register() async {
    // Implement your registration logic here
    String username = usernameController.text;
    String nama = namaController.text;
    String email = emailController.text;
    String hp = hpController.text;

    // Perform registration using the provided data
    print('Username: $username');
    print('Nama: $nama');
    print('Email: $email');
    print('HP: $hp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Form')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/iconrantang/RantangLogo.png',
              width: 100,
              height: 100), // Ganti dengan path gambar Anda
              SizedBox(height: 16),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: hpController,
                decoration: InputDecoration(labelText: 'HP'),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _register,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
