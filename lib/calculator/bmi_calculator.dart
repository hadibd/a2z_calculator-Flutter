import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female }

class BmiCalculator extends StatefulWidget {
  //const BmiCalculator({Key key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Color activeColor = Colors.deepOrangeAccent;
  Color inactiveColor = Colors.orange;
  bool isMaleSelected = false, isFemaleSelected = false;
  int weight = 50;
  int age = 30;
  double height = 180.0;

  void selectedGender(String gender) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMaleSelected = true;
                          isFemaleSelected = false;
                        });
                      },
                      child: ReUsableCard(
                        bgColor: isMaleSelected ? activeColor : inactiveColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabelText(label: 'Male'),
                            MyFaIcon(
                              faIcon: FontAwesomeIcons.mars,
                              iconSize: 50.0,
                            )
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMaleSelected = false;
                          isFemaleSelected = true;
                        });
                      },
                      child: ReUsableCard(
                        bgColor: isFemaleSelected ? activeColor : inactiveColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabelText(label: 'Female'),
                            MyFaIcon(
                              faIcon: FontAwesomeIcons.venusMars,
                              iconSize: 50.0,
                            )
                          ],
                        ),
                      )),
                ),
              ],
            )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4.0),
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toInt().toString(),
                            style: TextStyle(
                                fontSize: 35.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        onChanged: (double x) {
                          print(x);
                          setState(() {
                            height = x;
                          });
                        },
                        min: 100.0,
                        max: 200.0,
                        activeColor: Colors.black54,
                        inactiveColor: Colors.black26,
                      ),
                    ],
                  ),
                )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReUsableCard(
                  bgColor: Colors.orange,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LabelText(label: 'WEIGHT'),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40.0),
                            ),
                            Text('kg')
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            CircleAvatar(
                              child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                            ),
                          ],
                        )
                      ]),
                )),
                Expanded(
                    child: ReUsableCard(
                  bgColor: Colors.orange,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LabelText(label: 'AGE'),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40.0),
                            ),
                            Text('year')
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            CircleAvatar(
                              child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                            ),
                          ],
                        )
                      ]),
                )),
              ],
            )),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    CalculatorBrain calc =
                        CalculatorBrain(height: height, weight: weight);
                    String bmiResult = calc.getResult();
                    String bmiHeading = calc.getHeading();
                    String bmiDescription = calc.getDescription();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                  heading: bmiHeading,
                                  result: bmiResult,
                                  description: bmiDescription,
                                )));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      )),
                )),
              ],
            )
          ],
        ));
  }
}

class ReUsableCard extends StatelessWidget {
  ReUsableCard({required this.child, required this.bgColor});
  final Widget child;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      color: bgColor,
      child: child,
    );
  }
}

class CalculatorBrain {
  // CalculatorBrain({required this.height, required this.weight});
  CalculatorBrain({required this.height, required this.weight});
  final double height;
  final int weight;

  int bmi = 0;
  double result = 0;

  String getResult() {
    result = weight / (pow(height.round() / 100, 2));
    bmi = result.round();
    return bmi.toString();
  }

  String getHeading() {
    if (bmi >= 25) {
      return "overweight";
    }
    if (bmi >= 18) {
      return "Normal";
    } else {
      return "underweight";
    }
  }

  String getDescription() {
    if (bmi >= 25) {
      return "Go to gym and maintain diet";
    }
    if (bmi >= 18) {
      return "it's ok! your are Normal";
    } else {
      return "eat carefully with healthy food";
    }
  }
}

class LabelText extends StatelessWidget {
  LabelText({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }
}

class MyFaIcon extends StatelessWidget {
  MyFaIcon({required this.faIcon, required this.iconSize});

  final IconData faIcon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      faIcon,
      size: iconSize,
    );
  }
}


class Result extends StatelessWidget {
  //const Result({Key? key}) : super(key: key);

  final String heading, result, description;
  Result(
      {required this.heading,
        required this.result,
        required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "You Result",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            heading,
                            style:
                            TextStyle(fontSize: 20, color: Colors.black54),
                          ),
                          Text(
                            result,
                            style: TextStyle(
                                fontSize: 65,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            description,
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
