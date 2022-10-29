import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  int amount = 0;
  Payment(this.amount);
  @override
  State<Payment> createState() => _PaymentState(amount);
}

class _PaymentState extends State<Payment> {
  int amount = 0;
  _PaymentState(this.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Text(
                '請匯款到此帳戶：123123123',
                style: TextStyle(fontSize: 20.0),
              ),
              // DropdownButton(
              //   style: const TextStyle(fontSize: 20.0, color: Colors.black),
              //   value: from,
              //   items: const [
              //     DropdownMenuItem(value: 'munich', child: Text('慕尼黑')),
              //   ],
              //   onChanged: (String? value) {
              //     if (value == null) return;
              //     setState(() {
              //       from = value;
              //     });
              //   },
              // ),
            ],
          ),
          Row(
            children: [
              Text(
                '金額：$amount',
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
