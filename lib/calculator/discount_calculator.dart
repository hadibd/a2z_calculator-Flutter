import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:flutter/material.dart';

class DiscountCalculator extends StatefulWidget {
  const DiscountCalculator({Key? key}) : super(key: key);

  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  String result = '\$ 0.0';
  double productPrice = 0.0;
  double productDiscount = 0.0;

  final priceController = TextEditingController();
  final discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Discount Calculator'),
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
                    'Net Price',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8),
                  ),
                  Text(
                    'after discount',
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
              controller: priceController,
              onChanged: (value) {
                productPrice = double.parse(value);
              },
              decoration: InputDecoration(
                  hintText: 'Product Price',
                  labelText: 'Product Price',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: discountController,
              onChanged: (value) {
                productDiscount = double.parse(value);
              },
              decoration: InputDecoration(
                  hintText: 'Product Discount',
                  labelText: 'Product Discount',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 16.0,
            ),
            MaterialButton(
              color: Colors.deepOrangeAccent,
              onPressed: () {
                setState(() {
                  double res =
                      productPrice - (productPrice * (productDiscount / 100));
                  result = '\$ ' + res.toString();
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                child: Text(
                  'Check Price',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            result = '\$ 0.0';
            priceController.clear();
            discountController.clear();
          });
        },
        child: Icon(Icons.refresh_outlined),
      ),
    );
  }
}
