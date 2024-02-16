import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:genzo/firebase_options.dart';

import 'package:genzo/src/features/home/homescreen.dart';

import 'package:genzo/src/features/auth_screens/create_account/create_account.dart';

import 'package:genzo/src/commons/bottom_navigation/bottom_navigation.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: CreateAccount(),
      builder: EasyLoading.init(),
    );
  }
}
