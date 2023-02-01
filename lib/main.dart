import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'logic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 色の定義
  static const Color colorMain = Colors.black;
  static const Color colorNum = Colors.white10;
  static const Color colorFunc = Colors.white54;
  static const Color colorCalc = Colors.orange;
  static const Color colorText = Colors.white;

  String txtResult = "0";

  static const Map<String, IconData> _mapIcon = {
    "+/-": CupertinoIcons.plus_slash_minus,
    "%": CupertinoIcons.percent,
    "/": CupertinoIcons.divide,
    "x": CupertinoIcons.multiply,
    "-": CupertinoIcons.minus,
    "+": CupertinoIcons.plus,
    "=": CupertinoIcons.equal,
  };

  final Logic _logic = Logic();


  Widget button(String text, Color colorButton, Color colorText) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          onPressed: () {
            _logic.input(text);
            setState(() {
              txtResult = _logic.text;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            foregroundColor: colorText,
            shape: text == "0" ? const StadiumBorder() : const CircleBorder(),
          ),
          child: Padding(
            padding: text == "0"
                ? const EdgeInsets.only(
                left: 20, top: 20, right: 120, bottom: 20)
                : text.length == 1
                ? const EdgeInsets.all(22)
                : const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
            child: _mapIcon.containsKey(text)
                ? Icon(
              _mapIcon[text],
              size: 20,
            )
                : Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    txtResult,
                    style: const TextStyle(
                      color: colorText,
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("C", colorFunc, colorMain),
                button("+/-", colorFunc, colorMain),
                button("%", colorFunc, colorMain),
                button("/", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("7", colorNum, colorText),
                button("8", colorNum, colorText),
                button("9", colorNum, colorText),
                button("x", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("4", colorNum, colorText),
                button("5", colorNum, colorText),
                button("6", colorNum, colorText),
                button("-", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("1", colorNum, colorText),
                button("2", colorNum, colorText),
                button("3", colorNum, colorText),
                button("+", colorCalc, colorText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("0", colorNum, colorText),
                button(".", colorNum, colorText),
                button("=", colorCalc, colorText),
              ],
            ),
          ],
        ),
      ),
    );
  } // end of state class

}