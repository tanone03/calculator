import 'package:flutter/material.dart';
import 'button.dart';
import 'package:function_tree/function_tree.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final grey = Colors.grey[800];
  final white = Colors.white;
  final green = Colors.lightGreenAccent[400];
  String display = '';
  String result = '';
  String comment = 'You cannot add more numbers';
  bool more = true;

  void btnOnClick(String text) {
    if (display.length > 20) {
      more = false;
    }
    if (text == 'C') {
      result = '';
      more = true;
    } else if (text == '=') {
      if (result.isNotEmpty) {
        result = result.interpret().toStringAsFixed(0);
      }
    } else if (text == 'x') {
      result += '*';
    } else if (text == '<') {
      result = result.substring(0, result.length - 1);
    } else {
      result += text;
    }
    setState(() {
      display = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 8, top: 100, left: 8),
                child: Text(more == true ? display : comment,
                    style: TextStyle(color: white, fontSize: 40)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('(', grey, green, btnOnClick),
                CalcButton(')', grey, green, btnOnClick),
                CalcButton('%', grey, green, btnOnClick),
                CalcButton('<', grey, green, btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('7', grey, white, btnOnClick),
                CalcButton('8', grey, white, btnOnClick),
                CalcButton('9', grey, white, btnOnClick),
                CalcButton('x', grey, green, btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('4', grey, white, btnOnClick),
                CalcButton('5', grey, white, btnOnClick),
                CalcButton('6', grey, white, btnOnClick),
                CalcButton('-', grey, green, btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('1', grey, white, btnOnClick),
                CalcButton('2', grey, white, btnOnClick),
                CalcButton('3', grey, white, btnOnClick),
                CalcButton('+', grey, green, btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('C', grey, Colors.redAccent[700], btnOnClick),
                CalcButton('0', grey, white, btnOnClick),
                CalcButton(',', grey, white, btnOnClick),
                CalcButton('=', green, white, btnOnClick),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
