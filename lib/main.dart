import 'package:flutter/material.dart';
import 'pages/schlossNeuschwanstein_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color(0xFFFFCC00),
        appBar: AppBar(
          title: const Center(child: Text('Midas Travel')),
        ),
        body: Column(
          children: const [
            SchlossNeuschwansteinPage(),
          ],
        ),
      ),
    );
  }
}
