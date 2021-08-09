import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:a2z_calculator/widget/my_drawer.dart';
import 'package:flutter/material.dart';

const card_vMargin = 5.0;
const card_hMargin = 10.0;
const card_vPadding = 5.0;
const card_hPadding = 10.0;
const left_title_text_size = 16.0;
const card_color = Color(0xffd7fba6);

class TipsCalculator extends StatefulWidget {
  const TipsCalculator({Key? key}) : super(key: key);

  @override
  _TipsCalculatorState createState() => _TipsCalculatorState();
}

class _TipsCalculatorState extends State<TipsCalculator> {
  double finalAmount = 0, perPerson = 0;
  late double bill, people, tipsInPercent;

  final billController = TextEditingController();
  final peopleController = TextEditingController();
  final tipsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Tips Calculator'),
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
              color: Colors.orangeAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Final Amount:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: labelText(finalAmount.toStringAsFixed(1))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Amount Per Person:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: labelText(perPerson.toStringAsFixed(1))),
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
                    child: labelText('Bill Amount'),
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
                    controller: billController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), isDense: true),
                    onChanged: (value) {
                      bill = double.parse(value);
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
                    child: labelText('Number of People'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: peopleController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), isDense: true),
                    onChanged: (value) {
                      people = double.parse(value);
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
                    child: labelText('Tips'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: tipsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        suffix: Text('%')),
                    onChanged: (value) {
                      tipsInPercent = double.parse(value);
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
                  finalAmount =
                      ((bill * (tipsInPercent / 100)) * people) + bill;
                  perPerson = bill * (tipsInPercent / 100);
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
            finalAmount = 0.0;
            perPerson = 0.0;
            billController.clear();
            peopleController.clear();
            tipsController.clear();
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
