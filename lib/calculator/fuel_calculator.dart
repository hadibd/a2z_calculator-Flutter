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

class FuelCalculator extends StatefulWidget {
  const FuelCalculator({Key? key}) : super(key: key);

  @override
  _FuelCalculatorState createState() => _FuelCalculatorState();
}

class _FuelCalculatorState extends State<FuelCalculator> {
  double expectedFuel = 0, expectedCost = 0;
  late double distance, fuelEconomy, fuelCost;

  final distanceController = TextEditingController();
  final economyController = TextEditingController();
  final priceController = TextEditingController();

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
                        child: labelText('Expected Fuel:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: labelText(expectedFuel.toStringAsFixed(1))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: labelText('Fuel Cost:'),
                        alignment: Alignment.center,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        flex: 1,
                        child: labelText(expectedCost.toStringAsFixed(1))),
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
                    child: labelText('Distance'),
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
                    controller: distanceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffix: Text('km'),
                        isDense: true),
                    onChanged: (value) {
                      distance = double.parse(value);
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
                    child: labelText('Fuel Economy'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: economyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        suffix: Text('km/L')),
                    onChanged: (value) {
                      fuelEconomy = double.parse(value);
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
                    child: labelText('Fuel Price'),
                    alignment: Alignment.center,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        suffix: Text('/L')),
                    onChanged: (value) {
                      fuelCost = double.parse(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          MaterialButton(
            height: 50.0,
            minWidth: 150.0,
            onPressed: () {
              setState(() {
                expectedFuel = distance / fuelEconomy;
                expectedCost = expectedFuel * fuelCost;
              });
            },
            color: Theme.of(context).primaryColor,
            child: Text(
              'Calculate',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            expectedFuel = 0.0;
            expectedCost = 0.0;
            distanceController.clear();
            economyController.clear();
            priceController.clear();
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
