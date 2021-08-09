import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:a2z_calculator/widget/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const card_vMargin = 5.0;
const card_hMargin = 10.0;
const card_vPadding = 5.0;
const card_hPadding = 10.0;
const left_title_text_size = 16.0;
const card_color = Color(0xffd7fba6);

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  double emi = 0, interestPay = 0, totalPayment = 0;
  late double loanAmount, interestRate, time;

  final loanAmountController = TextEditingController();
  final interestController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('EMI Calculator'),
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
                        child: labelText('EMI:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(flex: 1, child: labelText(emi.toStringAsFixed(1))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Total interest:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: labelText(interestPay.toStringAsFixed(1))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Total Payment:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: labelText(totalPayment.toStringAsFixed(1))),
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
                    child: labelText('Loan Amount'),
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
                    controller: loanAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      loanAmount = double.parse(value);
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
                    controller: interestController,
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
          Container(
            width: 120.0,
            height: 50.0,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  interestPay = loanAmount * (interestRate / 100) * time;
                  totalPayment = loanAmount + interestPay;
                  emi = totalPayment / (time * 12);
                });
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            emi = 0.0;
            interestPay = 0.0;
            totalPayment = 0.0;
            loanAmountController.clear();
            interestController.clear();
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
