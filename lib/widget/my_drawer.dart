import 'package:a2z_calculator/calculator/age_calculator.dart';
import 'package:a2z_calculator/calculator/bmi_calculator.dart';
import 'package:a2z_calculator/calculator/cgpa_calculator.dart';
import 'package:a2z_calculator/calculator/discount_calculator.dart';
import 'package:a2z_calculator/calculator/fuel_calculator.dart';
import 'package:a2z_calculator/calculator/interest_calculator.dart';
import 'package:a2z_calculator/calculator/loan_calculator.dart';
import 'package:a2z_calculator/calculator/percentage_calculator.dart';
import 'package:a2z_calculator/calculator/tax_calculator.dart';
import 'package:a2z_calculator/calculator/tips_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final String c = 'Calculator';

  void calculatorNavigator(String id) {
    if (id == 'AGE') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AgeCalculator()));
    }
    if (id == 'BMI') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BmiCalculator()));
    }
    if (id == 'CGPA') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CgpaCalculator()));
    }
    if (id == 'DISCOUNT') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DiscountCalculator()));
    }
    if (id == 'FUEL') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FuelCalculator()));
    }
    if (id == 'INTEREST') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InterestCalculator()));
    }
    if (id == 'LOAN') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoanCalculator()));
    }
    if (id == 'TAX') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TaxCalculator()));
    }
    if (id == 'TIPS') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TipsCalculator()));
    }
    if (id == 'PERCENT') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PercentageCalculator()));
    }
  }

  Widget myListTile(String title, String id) {
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      leading: Icon(Icons.calculate_outlined),
      visualDensity: VisualDensity(vertical: -1.0),
      horizontalTitleGap: 0.0,
      minVerticalPadding: 0.0,
      onTap: () => calculatorNavigator(id),
    );
  }

  Widget headingText(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Container(
        height: 50.0,
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: Colors.black54),
        ),
      ),
    );
  }

  Widget myDivider() {
    return Divider(
      height: 1.0,
      thickness: 1.0,
    );
  }

  Widget calculator() {
    return Column(
      children: [
        myListTile('Age $c', 'AGE'),
        myListTile('BMI $c', 'BMI'),
        myListTile('CGPA $c', 'CGPA'),
        myListTile('Discount $c', 'DISCOUNT'),
        myListTile('Fuel $c', 'FUEL'),
        myListTile('Interest $c', 'INTEREST'),
        myListTile('Loan $c', 'LOAN'),
        myListTile('Tax $c', 'TAX'),
        myListTile('Tips $c', 'TIPS'),
        myListTile('Percentage $c', 'PERCENT'),
      ],
    );
  }

  Widget converter() {
    return Column(
      children: [
        myListTile('Unit Converter', 'UNIT'),
        myListTile('Currency Converter', 'CURRENCY'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                otherAccountsPictures: [
                  CircleAvatar(
                    child: Text(
                      'v2.0',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  )
                ],
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.calculate_outlined),
                ),
                accountName: Text(
                  'a2z Calculator',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                accountEmail: Text(
                  'Shine Up Labs',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                )),
            headingText('Calculator'),
            calculator(),
            SizedBox(
              height: 10.0,
            ),
            myDivider(),
            headingText('Converter'),
            converter(),
            //toggle == 0 ? calculator() : converter()
          ],
        ),
      ),
    ));
  }
}
