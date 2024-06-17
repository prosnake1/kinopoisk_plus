import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KinopoiskPlusApp());
} //s
