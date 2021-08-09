import 'dart:math';

import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:a2z_calculator/widget/my_drawer.dart';
import 'package:flutter/material.dart';

const card_vMargin = 5.0;
const card_hMargin = 10.0;
const card_vPadding = 5.0;
const card_hPadding = 10.0;
const left_title_text_size = 16.0;
const card_color = Color(0xffd7fba6);

class InterestCalculator extends StatefulWidget {
  const InterestCalculator({Key? key}) : super(key: key);

  @override
  _InterestCalculatorState createState() => _InterestCalculatorState();
}

class _InterestCalculatorState extends State<InterestCalculator> {
  double interest = 0, total = 0;
  late double depositAmount, interestRate, time;

  final depositAmountController = TextEditingController();
  final interestRateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Interest Calculator'),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150.0,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(
                vertical: card_vMargin, horizontal: card_hMargin),
            padding: EdgeInsets.symmetric(
                vertical: card_vPadding, horizontal: card_hPadding),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              color: card_color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Interest earned:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1, child: labelText(interest.toStringAsFixed(1))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Maturity Amount:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1, child: labelText(total.toStringAsFixed(1))),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: card_vMargin, horizontal: card_hMargin),
            padding: EdgeInsets.symmetric(
                vertical: card_vPadding, horizontal: card_hPadding),
            color: card_color,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: labelText('Deposit Amount'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                VerticalDivider(
                  width: 1.0,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: depositAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      depositAmount = double.parse(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: card_vMargin, horizontal: card_hMargin),
            padding: EdgeInsets.symmetric(
                vertical: card_vPadding, horizontal: card_hPadding),
            color: card_color,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: labelText('Interest Rate %'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: interestRateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      interestRate = double.parse(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: card_vMargin, horizontal: card_hMargin),
            padding: EdgeInsets.symmetric(
                vertical: card_vPadding, horizontal: card_hPadding),
            color: card_color,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: labelText('Time (Year)'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: timeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      time = double.parse(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: MaterialButton(
                    height: 50.0,
                    onPressed: () {
                      setState(() {
                        interest = (interestRate * depositAmount * time) / 100;
                        total = depositAmount + interest;
                      });
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Simple interest',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 1,
                  child: MaterialButton(
                    height: 50.0,
                    onPressed: () {
                      setState(() {
                        double res = depositAmount * (1 + (interestRate / 100));
                        total = pow(res, time).toDouble();
                        interest = total - depositAmount;
                      });
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Compound Interest',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            interest = 0.0;
            total = 0.0;
            depositAmountController.clear();
            interestRateController.clear();
            timeController.clear();
          });
        },
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }

  Text labelText(String label) {
    return Text(
      label,
      style: TextStyle(
          fontSize: left_title_text_size, fontWeight: FontWeight.bold),
    );
  }
}
