import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:moneytracka_test/screen/controller/app_inputs.dart';
import 'package:moneytracka_test/screen/controller/app_controller.dart';
// ignore_for_file: use_build_context_synchronously
// ignore_for_file: avoid_print

class RegisterApi {
  static Future registerApi(BuildContext context) async {
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
                "Registration ongoing please hold...",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        actions: const [Text('')],
      ),
    );

    String apiEndpoint = 'https://stacked.com.ng/api/register';
    final String username = registerUserName.text;
    final String password = registerPassword.text;
    final String email = registerEmail.text;
    final String number = registerPhoneNumber.text;
    final String address = registerAddress.text;
    final XFile? imageFile = ImageSelector.image;

    if (imageFile != null) {
      // Read image file as bytes
      List<int> imageBytes = await imageFile.readAsBytes();

      final response = await http.post(
        Uri.parse(apiEndpoint),
        body: jsonEncode({
          'username': username,
          'password': password,
          'email': email,
          'phone': number,
          'address': address,
          'image': base64Encode(imageBytes)
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print('My StatusCode ${response.statusCode}');
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print('My response $responseData');
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        registerUserName.clear();
        registerPassword.clear();
        registerEmail.clear();
        registerPhoneNumber.clear();
        registerAddress.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Register Successful'),
            duration: Duration(seconds: 3),
          ),
        );
      } else if (response.statusCode == 409) {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username already exists'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        print('error code ${response.body}');
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      print('Please select an image');
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an image'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
