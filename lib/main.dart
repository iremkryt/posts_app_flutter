import 'package:flutter/material.dart';
import 'package:posts_app_flutter/core/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      title: 'Posts App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('POSTS'),
        ),
        body: Center(
          child: Container(
            child: Text('Post Appe hoşgeldiniz'),
          ),
        ),
      ),
    );
  }
}