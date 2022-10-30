import 'package:Travami/pages/select_place_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:matomo_tracker/matomo_tracker.dart';
import 'package:share_plus/share_plus.dart';

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
    return MaterialApp(
      home: const MainPage(),
      builder: EasyLoading.init(),
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Midas Travel'),
            IconButton(
                iconSize: 20.0,
                icon: Icon(Icons.share),
                onPressed: () async {
                  await Share.share(
                      'Travami \n${'https://intrasystem.card168.cc/pftest/BTS/'}');
                }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
