import 'package:Travami/pages/schlossNeuschwanstein_item.dart';
import 'package:flutter/material.dart';

class SelectPlacePage extends StatelessWidget {
  const SelectPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator MainpageWidget - FRAME
    return Container(
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
                  height: 1050.3333740234375,
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
                    Positioned(
                        top: 63,
                        left: 0,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SchlossNeuschwansteinPage()));
                            },
                            child: Container(
                                width: 320,
                                height: 213.3333282470703,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/Img.png'),
                                      fit: BoxFit.fitWidth),
                                )))),
                    const Positioned(
                        top: 39,
                        left: 0,
                        child: Text(
                          '新天鵝堡夢幻半日遊',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(189, 68, 0, 1),
                              fontFamily: 'Helvetica',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    const Positioned(
                        top: 297,
                        left: 0,
                        child: Text(
                          '巴黎罗浮宫博物馆快速通關門票',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(189, 68, 0, 1),
                              fontFamily: 'Helvetica',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 321,
                        left: 0,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SchlossNeuschwansteinPage()));
                            },
                            child: Container(
                                width: 320,
                                height: 213.3333282470703,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Louvre1.png'),
                                      fit: BoxFit.fitWidth),
                                )))),
                    const Positioned(
                        top: 555,
                        left: 0,
                        child: Text(
                          '圣米歇尔山博物馆門票',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(189, 68, 0, 1),
                              fontFamily: 'Helvetica',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 579,
                        left: 0,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SchlossNeuschwansteinPage()));
                            },
                            child: Container(
                                width: 320,
                                height: 213.62637329101562,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Montsaintmichel1.png'),
                                      fit: BoxFit.fitWidth),
                                )))),
                    const Positioned(
                        top: 813,
                        left: 0,
                        child: Text(
                          '圣米歇尔山博物馆門票',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(189, 68, 0, 1),
                              fontFamily: 'Helvetica',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 837,
                        left: 0,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SchlossNeuschwansteinPage()));
                            },
                            child: Container(
                                width: 320,
                                height: 213.3333282470703,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Villefranchebay1.png'),
                                      fit: BoxFit.fitWidth),
                                )))),
                  ]))),
        ]));
  }
}
