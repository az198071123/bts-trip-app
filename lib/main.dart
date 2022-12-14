import 'package:Travami/pages/country_page.dart';
import 'package:Travami/services/subscribe_service.dart';
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
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Midas Travel'),
            IconButton(
                iconSize: 20.0,
                icon: const Icon(Icons.share),
                onPressed: () async {
                  await Share.share(
                      'Travami \n${'https://intrasystem.card168.cc/pftest/BTS/'}');
                }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CountryPage(),
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
      bottomNavigationBar: OutlinedButton.icon(
        icon: const Icon(
          Icons.notifications_active,
          size: 24.0,
        ),
        onPressed: () async {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Enter your Email to subscribe us!'),
              content: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'email',
                ),
                onChanged: (String? value) {
                  email = value ?? '';
                },
                validator: (String? value) {
                  return null;
                },
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      EasyLoading.show(
                          status: 'Subscribing...',
                          maskType: EasyLoadingMaskType.black);

                      var sub = SubscribeService();
                      await sub.subscribe(email: email);
                      EasyLoading.showSuccess('Great Success!');
                    } catch (e) {
                      EasyLoading.showError('Failed with Error: $e');
                      return;
                    }
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          );
        },
        label: const Text(
          'Subscribe!',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  @override
  String get traceName => 'Created MainPage'; // optional

  @override
  String get traceTitle => 'Midas Travel';
}
