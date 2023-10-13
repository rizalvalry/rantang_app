import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> printStoredToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      print('Stored Token: $token');
    } else {
      print('Token not found.');
    }
  }

  static Future<Map<String, dynamic>> fetchMemberData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    Map<String, dynamic> memberData = {}; // Inisialisasi dengan data kosong

    print(token);

     final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer YourAccessToken', // Ganti dengan access token Anda
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    // Lakukan sesuatu dengan data dari response
    print('ID: ${responseData['id']}');
    print('Title: ${responseData['title']}');
    print('UserID: ${responseData['userId']}');
  } else {
    print('HTTP request error: ${response.body}');
  }

    return memberData;
  }

  // Bisa menambahkan metode lain sesuai kebutuhan
}
