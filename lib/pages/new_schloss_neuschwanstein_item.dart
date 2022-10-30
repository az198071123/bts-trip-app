import 'package:Travami/pages/payment_page.dart';
import 'package:Travami/pages/train_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../services/order_service.dart';

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

  String _name = '';
  String _email = '';

  String _where = '新天鵝堡';

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Container(
          child: SingleChildScrollView(
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: '姓名 *',
                    ),
                    onChanged: (String? value) {
                      this._name = value ?? '';
                    },
                    validator: (String? value) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'E-mail *',
                    ),
                    onChanged: (String? value) {
                      this._email = value ?? '';
                    },
                    validator: (String? value) {},
                  ),
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

                    try {
                      var order = OrderService();
                      var orderId = await order.bookTicket(
                          name: this._name,
                          email: 'sheraium@gmail.com',
                          date: '2022-10-30',
                          time: '10:30',
                          adult: 1,
                          children: 0,
                          where: this._where,
                          price: 675);

                      print(orderId);
                    } catch (e) {
                      print(e);
                    }

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
                const SizedBox(
                  height: 20.0,
                  // width: 150.0,
                  child: Divider(
                    color: Colors.teal,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TrainPage()));
                  },
                  child: const Text(
                    '前往火車訂票',
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
          ),
        ));
  }
}
