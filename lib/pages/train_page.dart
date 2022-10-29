import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainPage extends StatefulWidget {
  @override
  State<TrainPage> createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  String? from = 'munich';
  String? to = 'neuschwanstein';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('訂購火車票'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('從：', style: TextStyle(fontSize: 20.0),),
              DropdownButton(
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
                value: from,
                items: const [
                  DropdownMenuItem(value: 'munich', child: Text('慕尼黑')),
                ],
                onChanged: (String? value) {
                  if (value == null) return;
                  setState(() {
                    from = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('到：', style: TextStyle(fontSize: 20.0),),
              DropdownButton(
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
                value: to,
                items: const [
                  DropdownMenuItem(value: 'neuschwanstein', child: Text('新天鵝堡')),
                ],
                onChanged: (String? value) {
                  if (value == null) return;
                  setState(() {
                    to = value;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              final Uri _url =
                  Uri.parse('https://buy.stripe.com/test_7sIeXHcn42sEcG48ww');
              if (!await launchUrl(_url)) {
                throw 'Could not launch $_url';
              }
            },
            child: const Text(
              '立即訂票',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
