import 'package:Travami/pages/select_place_page.dart';
import 'package:flutter/material.dart';
import 'package:matomo_tracker/matomo_tracker.dart';

void main() {
  MatomoTracker.instance.initialize(
    siteId: 1,
    url: 'https://tripptheworld.matomo.cloud/matomo.php',
  );
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

class _MainPageState extends State<MainPage> with TraceableClientMixin {
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

  @override
  String get traceName => 'Created MainPage'; // optional

  @override
  String get traceTitle => 'Midas Travel';
}
