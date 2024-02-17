import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart'
    as http; // Import http package for making HTTP requests

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); // Removed explicit 'key' parameter

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String apiResponse = ''; // Initialized the variable with an empty string

  @override
  void initState() {
    super.initState();
    fetchData(); // Call function to fetch data when app starts
  }

  Future<void> fetchData() async {
    try {
      // Make API GET request
      final response = await http
          .get(Uri.parse('https://genzobe.onrender.com/api/v1/stripeapikey'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('stripeApiKey') && data['stripeApiKey'] != null) {
          final String stripeApiKey = data['stripeApiKey'];
          print(stripeApiKey);
        } else {
          throw Exception(
              'Invalid data format: stripeApiKey is null or missing');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: apiResponse.isEmpty // Check if API response is empty
              ? CircularProgressIndicator() // Show loading indicator while fetching data
              : Text('API Response: $apiResponse'), // Display API response
        ),
      ),
      builder: EasyLoading.init(),
    );
  }
}

void main() {
  runApp(MyApp());
}
