import 'package:Travami/pages/payment_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewSchlossNeuschwansteinPage extends StatefulWidget {
  final String title;
  final String img;
  const NewSchlossNeuschwansteinPage(
      {Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  State<NewSchlossNeuschwansteinPage> createState() =>
      _NewSchlossNeuschwansteinPageState();
}

class _NewSchlossNeuschwansteinPageState
    extends State<NewSchlossNeuschwansteinPage> {
  DateTime date = DateTime.now();
  int peopleCount = 1;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 30.0),
              ),
              Center(
                child: Image(image: AssetImage(widget.img)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    '人數:  ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  DropdownButton(
                    icon: const Icon(
                      Icons.people,
                      size: 24.0,
                    ),
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
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text(
                  '日期:  ',
                  style: TextStyle(fontSize: 20.0),
                ),
                OutlinedButton.icon(
                  icon: const Icon(
                    Icons.date_range_outlined,
                    size: 24.0,
                  ),
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
                  label: Text(
                    DateFormat("yyyy-MM-dd").format(date),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ]),
              ElevatedButton(
                onPressed: () async {
                  // final Uri url =
                  //     Uri.parse('https://buy.stripe.com/test_7sIeXHcn42sEcG48ww');
                  // if (!await launchUrl(url)) {
                  //   throw 'Could not launch $url';
                  // }

                  // TODO: assign the amount
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PaymentPage(amount: 200)));
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
        ));
  }
}
