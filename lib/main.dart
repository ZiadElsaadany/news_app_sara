import 'package:flutter/material.dart';
import 'package:news/provider/butt_nav_pro.dart';
import 'package:news/provider/newsprovider.dart';
import 'package:news/provider/searchprovider.dart';
import 'package:news/view/home/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Buttonprovider()),
        ChangeNotifierProvider(create: (ctx) => Newsprovider()),
        ChangeNotifierProvider(create: (ctx) => SearchProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
