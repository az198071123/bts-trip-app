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
  bool isCheck = false;

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
          Card(
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
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
                          date = DateTime(newDate.year, newDate.month,
                              newDate.day, timeOfDay.hour, newDate.minute);
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
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
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
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
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
                  Checkbox(
                    value: isCheck,
                    activeColor: Colors.red, //选中时的颜色
                    onChanged: (value) {
                      setState(() {
                        isCheck = value!;
                      });
                    },
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PaymentPage(amount: amount)));
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
            ),
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              //指定索引及固定列宽
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(50.0),
              2: FixedColumnWidth(180.0),
            },
            //設定表格樣式
            border: TableBorder.all(
                color: Colors.black87, width: 2.0, style: BorderStyle.solid),
            children: const <TableRow>[
              TableRow(
                children: <Widget>[
                  Text('課程名稱'),
                  Text('講師'),
                  Text('上課時間'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  Text('測試資料一'),
                  Text('HKT'),
                  Text('每週 一、三 21:00~22:00'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  Text('測試資料二'),
                  Text('HKT'),
                  Text('每週 二、四 21:00~22:00'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  Text('測試資料三'),
                  Text('HKT'),
                  Text('每週 六 10:00~11:00'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
