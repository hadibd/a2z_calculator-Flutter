import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:flutter/material.dart';

class PercentageCalculator extends StatefulWidget {
  const PercentageCalculator({Key? key}) : super(key: key);

  @override
  _PercentageCalculatorState createState() => _PercentageCalculatorState();
}

class _PercentageCalculatorState extends State<PercentageCalculator> {
  String result = '0.0';
  String note = '';
  double number = 0.0;
  double percent = 0.0;

  final numberController = TextEditingController();
  final percentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Percentage Calculator'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              height: 150.0,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Result',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    note,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.4),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      result,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              onChanged: (value) {
                number = double.parse(value);
              },
              decoration: InputDecoration(
                  hintText: 'Number',
                  labelText: 'Number',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: percentController,
              onChanged: (value) {
                percent = double.parse(value);
              },
              decoration: InputDecoration(
                  hintText: 'Percent',
                  labelText: 'Percent',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    setState(() {
                      double res1 = number * (percent / 100);
                      double res2 = number + number * (percent / 100);
                      result = res2.toString();
                      note =
                          '$percent% of $number is $res1 and total after add';
                    });
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                MaterialButton(
                  minWidth: 150.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    setState(() {
                      double res = number * (percent / 100);
                      result = res.toString();
                      note = '$percent% of $number is';
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    setState(() {
                      double res1 = number * (percent / 100);
                      double res2 = number - number * (percent / 100);
                      result = res2.toString();
                      note =
                          '$percent% of $number is $res1 and total after subtraction';
                    });
                  },
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            result = '0.0';
            note = ' ';
            numberController.clear();
            percentController.clear();
          });
        },
        child: Icon(Icons.refresh_outlined),
      ),*/
    );
  }
}
