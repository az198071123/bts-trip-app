import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class TrainPage extends StatefulWidget {

  @override
  State<TrainPage> createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            '火車票',
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
