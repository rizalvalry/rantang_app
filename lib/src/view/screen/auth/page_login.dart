import 'dart:convert';

import 'package:e_commerce_flutter/src/view/animation/custom_loading_indicator.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  bool isLoading = false; 
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    String username = usernameController.text;
    String password = passwordController.text;

    var url = Uri.parse('http://192.168.1.28/cms.rantang/login/rantang_login');
    var response = await http.post(url, body: {'username': username, 'password': password});

    setState(() {
      isLoading = false; 
    });

    var responseData = json.decode(response.body);
    String token = responseData['token']?.toString() ?? '';
    bool success = responseData['success'];
    String message = responseData['message'];

    if (success) {
      // Simpan token ke shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print('Login successful: $message');

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Username or Password is Invalid.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Form')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/iconrantang/logo-rantangqu.png',
                  width: 200, height: 200),
              SizedBox(height: 16),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 24),
              ElevatedButton(
              onPressed: isLoading ? null : _login,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
              ),
              child: isLoading
                  ? CustomLoadingIndicator() 
                  : Text('Login'),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
