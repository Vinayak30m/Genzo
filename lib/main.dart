import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:genzo/firebase_options.dart';
import 'package:genzo/src/commons/bottom_navigation/bottom_navigation.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home:
          // CategoriesScreen(
          //     videoUrl: 'https://youtu.be/F5RNFiT1GNY?si=UBRsrW6IkajFvMte',
          //     categoryName: 'Ayurveda'),
          MyHomePage(),
    );
  }
}
