import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:a2z_calculator/widget/my_drawer.dart';
import 'package:flutter/material.dart';

const card_vMargin = 5.0;
const card_hMargin = 10.0;
const card_vPadding = 5.0;
const card_hPadding = 10.0;
const left_title_text_size = 16.0;
const card_color = Color(0xffd7fba6);

class TaxCalculator extends StatefulWidget {
  const TaxCalculator({Key? key}) : super(key: key);

  @override
  _TaxCalculatorState createState() => _TaxCalculatorState();
}

class _TaxCalculatorState extends State<TaxCalculator> {
  double tax = 0, totalPrice = 0;
  late double taxRate, originalPrice;

  final taxRateController = TextEditingController();
  final originalPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Tax Calculator'),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120.0,
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
                        child: labelText('Tax:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(flex: 1, child: labelText(tax.toStringAsFixed(1))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Total Price:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: labelText(totalPrice.toStringAsFixed(1))),
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
                    child: labelText('Tax Rate'),
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
                    controller: taxRateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      taxRate = double.parse(value);
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
                    child: labelText('Original Price:'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: originalPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      originalPrice = double.parse(value);
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
                  tax = originalPrice * (taxRate / 100);
                  totalPrice = originalPrice + tax;
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
            taxRate = 0.0;
            originalPrice = 0.0;

            taxRateController.clear();
            originalPriceController.clear();
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
