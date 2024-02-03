import 'package:flutter/material.dart';
import 'package:wall_x/views/screens/category_page.dart';
import 'package:wall_x/views/screens/home.dart';

const apiURL = "uoUDsoZt9sDd73WL6f6j5xy5S4CTbovxEWg3vdhICq56YTJCMQVjgwtu";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallpaperX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
