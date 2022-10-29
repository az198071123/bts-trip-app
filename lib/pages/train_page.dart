import 'package:Travami/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainPage extends StatefulWidget {
  @override
  State<TrainPage> createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  String? from = 'munich';
  String? to = 'neuschwanstein';
  DateTime date = DateTime.now();

  List<DropdownMenuItem<String>> formItems = [
    const DropdownMenuItem(value: 'munich', child: Text('慕尼黑')),
  ];

  List<DropdownMenuItem<String>> toItems = const [
    DropdownMenuItem(value: 'neuschwanstein', child: Text('新天鵝堡')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('訂購火車票'),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Text(
              '選擇日期:  ',
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

                final timeOfDay = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

                if (timeOfDay == null) return;

                setState(() {
                  date = DateTime(newDate.year, newDate.month, newDate.day,
                      timeOfDay.hour, newDate.minute);
                });
              },
              label: Text(
                DateFormat("yyyy-MM-dd HH:mm:ss").format(date),
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ]),
          Row(
            children: [
              const Text(
                '從：',
                style: TextStyle(fontSize: 20.0),
              ),
              DropdownButton(
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
                value: from,
                items: formItems,
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
              const Text(
                '到：',
                style: TextStyle(fontSize: 20.0),
              ),
              DropdownButton(
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
                value: to,
                items: toItems,
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
              // final Uri url =
              //     Uri.parse('https://buy.stripe.com/test_7sIeXHcn42sEcG48ww');
              // if (!await launchUrl(url)) {
              //   throw 'Could not launch $url';
              // }
              double amount = 0;
              switch (from) {
                case 'munich':
                  amount = 999; // TODO
                  break;
                default:
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage(amount)));
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
