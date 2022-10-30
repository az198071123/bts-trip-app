import 'dart:convert';
import 'package:http/http.dart' as http;

// onPressed: () async {
// try {
// var order = OrderService();
// var orderId = await order.bookTicket(
// name: 'peter',
// email: 'sheraium@gmail.com',
// date: '2022-10-30',
// time: '10:30',
// adult: 1,
// children: 0,
// where: '新天鵝堡',
// price: 675);

// print(orderId);
// } catch (e) {
// print(e);
// }

class OrderService {
//   {
//   name,
//   stripeCode,
//   type, 0: 車票  1: 門票
//   date (date),
//   time (time),
//   adult (int),
//   children (int),
//   from (string),
//   to (string),
//   price (float)
//   //第二種票，以門票文主
//   type_1,, 0: 車票  1: 門票
//   date_1 (date),
//   time_1 (time),
//   adult_1 (int),
//   children_1 (int),
//   from_1 (string),
//   to_1 (string),
//   price (float)
// }

  // I/flutter (11894): Response status: 200
  // I/flutter (11894): Response body: {"errCode":0,"order_id":"45"}

  Future<String> bookTicket(
      {required String name,
      required String email,
      required String date,
      required String time,
      required int adult,
      required int children,
      required String where,
      required double price}) async {
    var url = Uri.parse('https://intrasystem.card168.cc/pftest/BTS/order.php');

    var body = {
      'name': name,
      'email': email,
      'stripeCode': '',
      'type': '0',
      'date': date, // '2022-10-30'
      'time': time, // '10:30'
      'adult': adult.toString(),
      'children': children.toString(),
      'from': '',
      'to': where,
      'price': price.toString()
    };
    var response = await http.post(
      url,
      body: body,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var data = jsonDecode(response.body);
    print(data['errCode']);
    print(data['order_id']);

    if (data['errCode'] != 0) {
      throw response.body;
    }

    return data['order_id'].toString();
  }

  Future<String> bookTrainTicket(
      {required String name,
      required String email,
      required String date,
      required String time,
      required int adult,
      required int children,
      required String from,
      required String to,
      required double price}) async {
    var url = Uri.parse('https://intrasystem.card168.cc/pftest/BTS/order.php');

    var body = {
      'name': name,
      'email': email,
      'stripeCode': '',
      'type': '1',
      'date': date, // '2022-10-30'
      'time': time, // '10:30'
      'adult': adult.toString(),
      'children': children.toString(),
      'from': from,
      'to': to,
      'price': price.toString()
    };
    var response = await http.post(
      url,
      body: body,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var data = jsonDecode(response.body);
    print(data['errCode']);
    print(data['order_id']);

    if (data['errCode'] != 0) {
      throw response.body;
    }

    return data['order_id'].toString();
  }
}
