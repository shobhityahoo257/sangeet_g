

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/pages/demo_page.dart';
import 'package:sangeet_g/pages/home_page.dart';

import 'mobile.dart';
import 'otp.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ProviderScope(child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'mobile',
      routes: {
        'mobile': (context) => const MyMobile(),
        'otp':(context)=>const MyOtp(),
        'homePage':(context)=>const HomePage()
      }
  ),
    ),
  );
}