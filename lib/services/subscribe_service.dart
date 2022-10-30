import 'dart:convert';

import 'package:http/http.dart' as http;

class SubscribeService {
//   {
//   email,
// }

  // I/flutter (11894): Response status: 200
  // I/flutter (11894): Response body: {"errCode":0,"order_id":"45"}

  Future<String> subscribe({required String email}) async {
    var url =
        Uri.parse('https://intrasystem.card168.cc/pftest/BTS/subscript.php');

    var body = {
      'email': email,
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
