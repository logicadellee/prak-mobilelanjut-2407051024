import 'package:flutter/material.dart';
// import 'column_widget.dart';
// import 'row_widget.dart';
// import 'first_widget.dart';
// import 'form_widget.dart';
// import 'app_theme.dart';
// import 'responsive_profile.dart';
// import 'assets_media.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 7 - Animations',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}