import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/router.dart';
import 'package:kinopoisk_plus/theme/theme.dart';

class KinopoiskPlusApp extends StatelessWidget {
  const KinopoiskPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routes: router,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/top',
    );
  }
}
