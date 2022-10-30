import 'package:Travami/pages/select_place_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Midas Travel')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SelectPlacePage(),
            SizedBox(
              height: 20.0,
              // width: 150.0,
              child: Divider(
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
