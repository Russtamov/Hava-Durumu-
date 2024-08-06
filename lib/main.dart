import 'package:flutter/material.dart';
import 'package:hava_durumu_haftalik_app/screens/home_page.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home:MyHomePage() ,
    );
  }
}
