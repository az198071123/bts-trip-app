import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String _country = 'Belgium';
  String _city = 'Bruges';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('選擇國家/城市'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton(
              value: _country,
              items: [
                DropdownMenuItem(value: 'Belgium', child: Text('Belgium')),
                DropdownMenuItem(value: 'Canada', child: Text('Canada')),
                DropdownMenuItem(value: 'France', child: Text('France')),
                DropdownMenuItem(value: 'Germany', child: Text('Germany')),
                DropdownMenuItem(value: 'Indonesia', child: Text('Indonesia')),
                DropdownMenuItem(value: 'Ireland', child: Text('Ireland')),
                DropdownMenuItem(value: 'Italy', child: Text('Italy')),
                DropdownMenuItem(value: 'Spain', child: Text('Spain')),
                DropdownMenuItem(
                    value: 'Switzerland', child: Text('Switzerland')),
                DropdownMenuItem(
                    value: 'United Kingdom', child: Text('United Kingdom')),
                DropdownMenuItem(
                    value: 'United States', child: Text('United States')),
              ],
              onChanged: (value) => {
                if (value != null) {_country = value}
              },
            ),
            DropdownButton(
              value: _city,
              items: [
                DropdownMenuItem(value: 'Bruges', child: Text('Bruges')),
                DropdownMenuItem(value: 'Brussels', child: Text('Brussels')),
                DropdownMenuItem(value: 'Ninove', child: Text('Ninove')),
                DropdownMenuItem(value: 'Ypres', child: Text('Ypres')),
              ],
              onChanged: (value) => {
                if (value != null) {_city = value}
              },
            ),
          ],
        ),
      ),
    );
  }
}
