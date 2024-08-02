import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/providers/theme_provider.dart';
import 'package:translator_app/themes/themes.dart';
import 'package:translator_app/views/HomeView.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeDataStyle,
      home: HomeView(),
    );
  }
}
