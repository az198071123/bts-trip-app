import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color(0xFFFFCC00),
        appBar: AppBar(
          title: const Center(child: Text('Midas Travel')),
        ),
        body: const MainPage(),
      ),
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime date = DateTime.now();
  int peopleCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '新天鵝堡夢幻半日遊',
            style: TextStyle(fontSize: 30.0),
          ),
          Center(
            child: Image(image: AssetImage('images/SchlossNeuschwanstein.png')),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                '人數: ',
                style: TextStyle(fontSize: 20.0),
              ),
              DropdownButton(
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                value: peopleCount,
                items: [
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
                style: TextStyle(fontSize: 20.0),
              ),
              OutlinedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: date,
                      lastDate: date.add(Duration(days: 60)));

                  if (newDate == null) return;

                  setState(() {
                    date = newDate;
                  });
                },
                child: Text(
                  '...',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
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
