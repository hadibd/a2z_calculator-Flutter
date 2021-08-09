import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:a2z_calculator/widget/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final date = DateTime.now();

  String initialCurrentYear = DateTime.now().year.toString();
  String initialCurrentMonth = DateTime.now().month.toString();
  String initialCurrentDay = DateTime.now().day.toString();

  DateTime? birthDate;
  DateTime? currentDate;

  Future myDatePicker(BuildContext context, int id) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: (id == 1 ? birthDate : currentDate) ?? date,
      firstDate: DateTime(DateTime.now().year - 200),
      lastDate: DateTime(DateTime.now().year + 200),
    );
    if (pickedDate == null) return;
    if (id == 1) {
      setState(() {
        birthDate = pickedDate;
      });
    }
    if (id == 2) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  String getCurrentDateButtonText() {
    if (currentDate == null) {
      return '$initialCurrentYear-$initialCurrentMonth-$initialCurrentDay';
    } else {
      return '${currentDate!.year.toString()}-${currentDate!.month.toString()}-${currentDate!.day.toString()}';
    }
  }

  String getBirthDayButtonText() {
    if (birthDate == null) {
      return '$initialCurrentYear-$initialCurrentMonth-$initialCurrentDay';
    } else {
      return '${birthDate!.year.toString()}-${birthDate!.month.toString()}-${birthDate!.day.toString()}';
    }
  }

  void calculate() {
    int bYear = birthDate!.year;
    int bMonth = birthDate!.month;
    int bDay = birthDate!.day;

    int cDay;
    int cMonth;
    int cYear;

    int aDay;
    int aMonth;
    int aYear;

    if (currentDate == null) {
      cYear = DateTime.now().year;
      cMonth = DateTime.now().month;
      cDay = DateTime.now().day;
    } else {
      cYear = currentDate!.year;
      cMonth = currentDate!.month;
      cDay = currentDate!.day;
    }

    if (cMonth >= bMonth && cDay >= bDay) {
      aYear = cYear - bYear;
      aMonth = cMonth - bMonth;
      aDay = cDay - bDay;
      resultDialog(context, aDay, aMonth, aYear);
    } else if (cMonth < bMonth && cDay < bDay) {
      aYear = cYear - bYear;
      aYear--;
      cMonth = cMonth + 12;
      aMonth = cMonth - bMonth;
      aMonth--;
      cDay = cDay + 30;
      aDay = cDay - bDay;
      resultDialog(context, aDay, aMonth, aYear);
    } else if (cMonth < bMonth && cDay >= bDay) {
      aYear = cYear - bYear;
      aYear--;
      cMonth = cMonth + 12;
      aMonth = cMonth - bMonth;
      aDay = cDay - bDay;
      resultDialog(context, aDay, aMonth, aYear);
    } else if (cMonth >= bMonth && cDay <= bDay) {
      aYear = cYear - bYear;
      aMonth = cMonth - bMonth;
      aMonth--;
      cDay = cDay + 30;
      aDay = cDay - bDay;
      resultDialog(context, aDay, aMonth, aYear);
/*      print('year: ' + aYear.toString());
      print('month: ' + aMonth.toString());
      print('day: ' + aDay.toString());*/
    }
  }

  resultDialog(BuildContext context, int day, int month, int year) {
    AlertDialog dialog = AlertDialog(
      title: Text('Your age is:'),
      content: Text('$year years $month months $day days'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Age Calculator'),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Birth Date',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
              MaterialButton(
                minWidth: 220.0,
                height: 50.0,
                color: Colors.deepOrangeAccent,
                onPressed: () => myDatePicker(context, 1),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    getBirthDayButtonText(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Pick Current Date',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
              MaterialButton(
                minWidth: 220.0,
                height: 50.0,
                color: Colors.deepOrangeAccent,
                onPressed: () => myDatePicker(context, 2),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    getCurrentDateButtonText(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              MaterialButton(
                minWidth: 220.0,
                height: 50.0,
                color: Colors.orangeAccent,
                onPressed: () => calculate(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Calculate Age',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
