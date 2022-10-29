import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  double amount = 0;
  PaymentPage(this.amount);
  @override
  State<PaymentPage> createState() => _PaymentPageState(amount);
}

class _PaymentPageState extends State<PaymentPage> {
  double amount = 0;
  _PaymentPageState(this.amount);

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
                """
中華信託銀行

帳戶號碼
9225 1234 4321 9876

銀行代碼
822

請蓮照這些指示
1. 請使用網路銀行或真體ATM存全籲轉大以上蝦長振戶。
2. 藉帳完成後30分逢可至訂单頁武查說付數狀態，並語保駕轉樣收读直至振款人振。若轉振後48小法仍未人帳，請在與我們聯繫查詢。
3. 安全提醒：若第三方對您提出以下要求，請勿直挨道浮他方指示如，第三方美求您轉振至和人根說、在ATM解陈分期何款，掃挂QR code進人非蝦友营方網站或提早卖求仁技下(完成訂單）等。
""",
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
