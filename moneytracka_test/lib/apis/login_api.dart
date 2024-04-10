import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneytracka_test/screen/app_ui/profile.dart';
import 'package:moneytracka_test/screen/controller/app_inputs.dart';
// ignore_for_file: use_build_context_synchronously
// ignore_for_file: avoid_print

class LoginApi {
  static Future loginApi(BuildContext context) async {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: const Color.fromARGB(255, 92, 92, 92),
        content: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Login ongoing...",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        actions: const [Text('')],
      ),
    );

    String apiEndpoint = 'https://stacked.com.ng/api/login';

    final String username = loginUserName.text;
    final String password = loginPassword.text;

    final response = await http.post(
      Uri.parse(apiEndpoint),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      print('My response $responseData');
      loginUserName.clear();
      loginPassword.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const Profile(),
        ),
      );
    } else {
      print('error code ${response.body}');
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
