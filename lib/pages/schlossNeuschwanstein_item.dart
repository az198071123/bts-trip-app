import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SchlossNeuschwansteinPage extends StatefulWidget {
  const SchlossNeuschwansteinPage({Key? key}) : super(key: key);

  @override
  State<SchlossNeuschwansteinPage> createState() =>
      _SchlossNeuschwansteinPageState();
}

class _SchlossNeuschwansteinPageState extends State<SchlossNeuschwansteinPage> {
  DateTime date = DateTime.now();
  int peopleCount = 1;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          const Text(
            '新天鵝堡夢幻半日遊',
            style: TextStyle(fontSize: 30.0),
          ),
          const Center(
            child: Image(image: AssetImage('images/SchlossNeuschwanstein.png')),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                '人數: ',
                style: TextStyle(fontSize: 20.0),
              ),
              DropdownButton(
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
                value: peopleCount,
                items: const [
                  DropdownMenuItem(value: 1, child: Text('1')),
                  DropdownMenuItem(value: 2, child: Text('2')),
                  DropdownMenuItem(value: 3, child: Text('3')),
                  DropdownMenuItem(value: 4, child: Text('4')),
                  DropdownMenuItem(value: 5, child: Text('5')),
                ],
                onChanged: (int? value) {
                  if (value == null) return;
                  setState(() {
                    peopleCount = value;
                  });
                },
              ),
              Text(
                '日期: ${date.year}/${date.month}/${date.day}',
                style: const TextStyle(fontSize: 20.0),
              ),
              OutlinedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: date,
                      lastDate: date.add(const Duration(days: 60)));

                  if (newDate == null) return;

                  setState(() {
                    date = newDate;
                  });
                },
                child: const Text(
                  '...',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              final Uri url =
                  Uri.parse('https://buy.stripe.com/test_7sIeXHcn42sEcG48ww');
              if (!await launchUrl(url)) {
                throw 'Could not launch $url';
              }
            },
            child: const Text(
              '立即訂票',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (kDebugMode) {
                print('api start');
              }
              var url = Uri.parse(
                  'https://intrasystem.card168.cc/pftest/BTS/order.php');

              // Map data = {'name': 'kano'};
              // var body = json.encode(data);
              var body = {
                'name': 'kano',
                'email': 'jerry.hong@arionlabs.com.tw'
              };
              var response = await http.post(
                url,
                body: body,
              );

              if (kDebugMode) {
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');
                print('api end');
              }
            },
            child: const Text(
              'PINUS',
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
