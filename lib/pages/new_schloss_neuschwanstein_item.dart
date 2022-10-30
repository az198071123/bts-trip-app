import 'package:Travami/pages/payment_page.dart';
import 'package:Travami/pages/train_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  String _name = '';
  String _email = '';
  int _adult = 1;
  int _children = 0;
  double _price = 675;

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
                      _name = value ?? '';
                    },
                    validator: (String? value) {
                      return null;
                    },
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
                      _email = value ?? '';
                    },
                    validator: (String? value) {
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      '大人:  ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    DropdownButton(
                      icon: const Icon(
                        Icons.people,
                        size: 24.0,
                      ),
                      style: const TextStyle(fontSize: 20.0, color: Colors.black),
                      value: _adult,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('1')),
                        DropdownMenuItem(value: 2, child: Text('2')),
                        DropdownMenuItem(value: 3, child: Text('3')),
                        DropdownMenuItem(value: 4, child: Text('4')),
                        DropdownMenuItem(value: 5, child: Text('5')),
                        DropdownMenuItem(value: 6, child: Text('6')),
                        DropdownMenuItem(value: 7, child: Text('7')),
                        DropdownMenuItem(value: 8, child: Text('8')),
                        DropdownMenuItem(value: 9, child: Text('9')),
                        DropdownMenuItem(value: 10, child: Text('10')),
                      ],
                      onChanged: (int? value) {
                        if (value == null) return;
                        setState(() {
                          _adult = value;
                        });
                      },
                    ),
                    const Text(
                      '小孩:  ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    DropdownButton(
                      icon: const Icon(
                        Icons.people,
                        size: 24.0,
                      ),
                      style: const TextStyle(fontSize: 20.0, color: Colors.black),
                      value: _children,
                      items: const [
                        DropdownMenuItem(value: 0, child: Text('0')),
                        DropdownMenuItem(value: 1, child: Text('1')),
                        DropdownMenuItem(value: 2, child: Text('2')),
                        DropdownMenuItem(value: 3, child: Text('3')),
                        DropdownMenuItem(value: 4, child: Text('4')),
                        DropdownMenuItem(value: 5, child: Text('5')),
                        DropdownMenuItem(value: 6, child: Text('6')),
                        DropdownMenuItem(value: 7, child: Text('7')),
                        DropdownMenuItem(value: 8, child: Text('8')),
                        DropdownMenuItem(value: 9, child: Text('9')),
                        DropdownMenuItem(value: 10, child: Text('10')),
                      ],
                      onChanged: (int? value) {
                        if (value == null) return;
                        setState(() {
                          _children = value;
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
                          initialDate: _date,
                          firstDate: _date,
                          lastDate: _date.add(const Duration(days: 60)));

                      if (newDate == null) return;
                      setState(() {
                        _date = newDate;
                      });
                    },
                    label: Text(
                      DateFormat("yyyy-MM-dd").format(_date),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text(
                    '日期:  ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(
                      Icons.access_time_filled,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      TimeOfDay? newTime  = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                      if (newTime == null) return;
                      setState(() {
                        _time = DateTime(_date.year, _date.month, _date.day, newTime.hour, newTime.minute);
                      });
                    },
                    label: Text(
                      DateFormat("HH:mm").format(_time),
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
                      EasyLoading.show(
                          status: 'Ordering...',
                          maskType: EasyLoadingMaskType.black);

                      var order = OrderService();
                      var orderId = await order.bookTicket(
                          name: this._name,
                          email: this._email,
                          date: DateFormat("yyyy-MM-dd").format(_date),
                          time: DateFormat("HH:mm").format(_date),
                          adult: this._adult,
                          children: this._children,
                          where: this._where,
                          price: this._price);
                      EasyLoading.showSuccess('Great Success!');

                      print(orderId);
                    } catch (e) {
                      print(e);
                      EasyLoading.showError('Failed with Error: $e');
                      return;
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
              ],
            ),
          ),
        ));
  }
}
