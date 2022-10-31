import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class SearchCriteria {
  late String from;
  late String to;
  late String date;
  late String time;
  late int adult;
  late int child;

  SearchCriteria(from, to, date, time, adult, child) {
    this.from = from;
    this.to = to;
    this.date = date;
    this.time = time;
    this.adult = adult;
    this.child = child;
  }

  String toQuery() {
    return "from=$from&to=$to&date=$date&time=$time&adult=$adult&child=$child";
  }

  Map<String, dynamic> toMap() {
    return {
      "from": from,
      "to": to,
      "date": date,
      "time": time,
      "adult": adult,
      "child": child
    };
  }
}

class GrailApiClient {
  final baseUrl;
  final apiKey;
  final secret;
  final http.Client httpClient;

  GrailApiClient(
      {required this.httpClient,
      @required this.baseUrl,
      @required this.apiKey,
      @required this.secret})
      : assert(httpClient != null);

  Map<String, String> getAuthorizationHeaders(Map<String, dynamic> params) {
    var timestamp = DateTime.now();
    params['t'] = (timestamp.millisecondsSinceEpoch ~/ 1000).toString();
    params['api_key'] = apiKey;

    var sortedKeys = params.keys.toList()..sort((a, b) => a.compareTo(b));
    StringBuffer buffer = StringBuffer("");
    sortedKeys.forEach((key) {
      if (params[key] is List || params[key] is Map) return;
      buffer.write('$key=${params[key].toString()}');
    });
    buffer.write(secret);

    String hashString = buffer.toString();
    String authorization = md5.convert(utf8.encode(hashString)).toString();

    return {
      "From": apiKey,
      "Content-Type": 'application/json',
      "Authorization": authorization,
      "Date": HttpDate.format(timestamp),
      "Api-Locale": "zh-TW"
    };
  }

  Future<dynamic> getSolutions(from, to, date, time, adult, child) async {
    final criteria = SearchCriteria(from, to, date, time, adult, child);
    final solutionUrl =
        '$baseUrl/api/v2/online_solutions/?${criteria.toQuery()}';

    final headers = getAuthorizationHeaders(criteria.toMap());
    print(headers);

    final solutionResponse =
        await this.httpClient.get(Uri.parse(solutionUrl), headers: headers);

    if (solutionResponse.statusCode != 200) {
      throw Exception('error getting solutions');
    }
    print(solutionResponse.body);
    final solutionsJson = jsonDecode(solutionResponse.body);
    print(solutionsJson);
    return solutionsJson;
  }

  Future<dynamic> getAsyncResult(String asyncKey) async {
    final asyncResultURl = '$baseUrl/api/v2/async_results/$asyncKey';
    final asyncResult = await this.httpClient.get(Uri.parse(asyncResultURl),
        headers: getAuthorizationHeaders({"async_key": asyncKey}));
    return {"data": jsonDecode(utf8.decode(asyncResult.bodyBytes))};
  }

  Future<dynamic> getResult(String from, String to, String date, String time,
      int adult, int child) async {
    var asyncKey = await getSolutions(from, to, date, time, adult, child);
    await Future.delayed(Duration(seconds: 5));
    var result = await getAsyncResult(asyncKey['async']);
    return result;
  }

  Future<int> getFirstPrice(dynamic result) async {
    try {
      var firstPrice = result['data'][0]['solutions'][0]['sections'][0]
          ['offers'][0]['services'][0]['price']['cents'];
      return firstPrice;
    } catch (err) {
      return 0;
    }
  }
}
