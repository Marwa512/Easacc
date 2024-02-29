// ignore_for_file: prefer_const_constructors

import 'package:eesac/view/login_screen.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
 
 

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await FacebookAuth.instance.logOut();
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home:   const LoginScreen() ,
    );
  }
}
