import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:a2z_calculator/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../widget.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = '';
  String result = '0';
  bool isNumber = false;
  bool is1stBraceUsed = false;
  var controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  void setData(String value) {
    setState(() {
      if (value == '0' ||
          value == '1' ||
          value == '2' ||
          value == '3' ||
          value == '4' ||
          value == '5' ||
          value == '6' ||
          value == '7' ||
          value == '8' ||
          value == '9') {
        isNumber = true;
      }
      if (value == '+' || value == '-' || value == '*' || value == '/') {
        isNumber = false;
      }
      switch (value) {
        case '×':
          value = '*';
          break;
        case '÷':
          value = '/';
          break;
      }
      equation = equation + value;
      controller.value = controller.value.copyWith(
        text: equation,
        selection:
            TextSelection.fromPosition(TextPosition(offset: equation.length)),
      );
    });
  }

  Widget customButton(String data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: OutlinedButton(
          onPressed: () {
            if (data == 'AC') {
              setState(() {
                equation = '';
                result = '0';
                controller.value = controller.value.copyWith(
                  text: equation,
                  selection: TextSelection.fromPosition(
                      TextPosition(offset: equation.length)),
                );
              });
            } else if (data == '=') {
              calculation();
            } else {
              setData(data);
            }
          },
          child: Text(
            data,
            style: numberButtonTextStyle,
          ),
        ),
      ),
    );
  }

  void calculation() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(equation);
      // Bind variables:
      ContextModel cm = ContextModel();

      // Evaluate expression:
      setState(() {
        result = expression.evaluate(EvaluationType.REAL, cm).toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('a2z Calculator'),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            /*Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  (equation.isEmpty) ? '0' : equation,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                  textAlign: TextAlign.right,
                ),
              ),
            ),*/
            TextFormField(
              readOnly: true,
              showCursor: true,
              controller: controller,
              style: TextStyle(fontSize: 30.0),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        result,
                        style: TextStyle(
                            fontSize: 48.0, fontWeight: FontWeight.bold),
                      ),
                    ))),
            Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.backspace_outlined),
                color: Colors.deepOrange,
                iconSize: 40.0,
                onPressed: () {
                  setState(() {
                    //equation = equation.substring(0, equation.length - 1);
                  });
                },
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                customButton('AC'),
                customButton('('),
                customButton(')'),
                customButton('÷'),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                customButton('7'),
                customButton('8'),
                customButton('9'),
                customButton('×'),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                customButton('4'),
                customButton('5'),
                customButton('6'),
                customButton('-'),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                customButton('1'),
                customButton('2'),
                customButton('3'),
                customButton('+'),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                customButton('00'),
                customButton('0'),
                customButton('.'),
                customButton('='),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
