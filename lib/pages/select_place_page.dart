import 'package:Travami/pages/new_schloss_neuschwanstein_item.dart';
import 'package:flutter/material.dart';

class SelectPlacePage extends StatelessWidget {
  final String title;
  const SelectPlacePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator MainpageWidget - FRAME
    return Scaffold(
        appBar: AppBar(
          title: const Text('選擇國家/城市'),
        ),
        body: Container(
            width: 360,
            height: 1177,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(children: <Widget>[
              Positioned(top: 0, left: 0, child: Column()),
              Positioned(
                  top: 20,
                  left: 20,
                  child: SizedBox(
                      width: 320,
                      height: 1300,
                      child: Stack(children: <Widget>[
                        const Positioned(
                            top: 0,
                            left: 0,
                            child: Text(
                              '旅遊景點',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Helvetica',
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        ...createItems(
                            title: 'Paris to Bruges Day Trip',
                            img: 'assets/images/bruges1.jpg',
                            index: 0,
                            context: context),
                        ...createItems(
                            title:
                                'Independant Bruges Tour with Transportation from Paris',
                            img: 'assets/images/bruges2.jpg',
                            index: 1,
                            context: context),
                      ]))),
            ])));
  }
}

List<Positioned> createItems(
    {required int index,
    required String title,
    required String img,
    required context}) {
  return [
    createTitle(title: title, index: index),
    createImg(title: title, img: img, index: index, context: context)
  ];
}

Positioned createTitle({required int index, required String title}) {
  print(39 + index * 300);
  return Positioned(
      top: 39 + index * 300,
      left: 0,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
            color: Color.fromRGBO(189, 68, 0, 1),
            fontFamily: 'Helvetica',
            fontSize: 16,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1),
      ));
}

Positioned createImg(
    {required int index,
    required String title,
    required String img,
    required context}) {
  return Positioned(
      top: 63 + index * 300,
      left: 0,
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NewSchlossNeuschwansteinPage(title: title, img: img)));
          },
          child: Container(
              width: 320,
              height: 213.3333282470703,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(img), fit: BoxFit.fitWidth),
              ))));
}
