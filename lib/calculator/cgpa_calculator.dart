import 'package:a2z_calculator/widget/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CgpaCalculator extends StatefulWidget {
  const CgpaCalculator({Key? key}) : super(key: key);

  @override
  _CgpaCalculatorState createState() => _CgpaCalculatorState();
}

class _CgpaCalculatorState extends State<CgpaCalculator> {
  List<DataModel> subjectNames = [];

  final nameController = TextEditingController();
  final creditController = TextEditingController();
  final gradeController = TextEditingController();
  var controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('CGPA Calculator'),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: subjectNames.isEmpty
                    ? Center(child: Text('Add Records to Calculate CGPA'))
                    : ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Color(0xFF81FBF0),
                            padding: EdgeInsets.only(left: 15.0),
                            margin: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 2.0),
                            height: 40.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: TextDataStyle(
                                        text: subjectNames[index]
                                            .subName
                                            .toString())),
                                Expanded(
                                    flex: 2,
                                    child: TextDataStyle(
                                        text: subjectNames[index]
                                            .credit
                                            .toString())),
                                Expanded(
                                    flex: 1,
                                    child: TextDataStyle(
                                        text: subjectNames[index]
                                            .grade
                                            .toString())),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: editDialog(index, context),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          subjectNames.removeAt(index);
                                        });
                                      },
                                      child: Icon(Icons.delete_forever)),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: subjectNames.length,
                        scrollDirection: Axis.vertical,
                      ),
              ),
              if (subjectNames.length > 1)
                OutlinedButton(
                    onPressed: () {
                      double totalCredit = 0;
                      double totalGrade = 0;
                      double result;
                      for (int i = 0; i <= subjectNames.length - 1; i++) {
                        totalCredit = totalCredit + subjectNames[i].credit;
                      }
                      for (int i = 0; i <= subjectNames.length - 1; i++) {
                        totalGrade = totalGrade +
                            (subjectNames[i].credit * subjectNames[i].grade);
                      }

                      result = totalGrade / totalCredit;

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                height: 200.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 50.0,
                                      child: Text(
                                        result.toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Text('is your CGPA',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                            );
                          });
                      // print('res ' + result.toString());
                    },
                    child: Text('Calculate CGPA')),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xfff8f5f5),
                ),
                padding: EdgeInsets.all(10.0),
                height: 220.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Subject Name:',
                        labelText: 'Subject Name',
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: creditController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Credit:',
                              labelText: 'Credit',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: gradeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Grade:',
                              labelText: 'Grade',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            subjectNames.add(DataModel(
                                nameController.text,
                                double.parse(creditController.text),
                                double.parse(gradeController.text)));
                            nameController.clear();
                            creditController.clear();
                            gradeController.clear();
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Add Subject',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ))
                  ],
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            subjectNames.clear();
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.refresh_sharp),
      ),
    );
  }

  GestureDetector editDialog(int index, BuildContext context) {
    return GestureDetector(
        onTap: () {
          nameController.value = nameController.value.copyWith(
            text: subjectNames[index].subName,
            selection: TextSelection.fromPosition(
                TextPosition(offset: subjectNames[index].subName.length)),
          );
          creditController.value = creditController.value.copyWith(
            text: subjectNames[index].credit.toString(),
            selection: TextSelection.fromPosition(
                TextPosition(offset: subjectNames[index].subName.length)),
          );
          gradeController.value = gradeController.value.copyWith(
            text: subjectNames[index].grade.toString(),
            selection: TextSelection.fromPosition(
                TextPosition(offset: subjectNames[index].subName.length)),
          );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                      padding: EdgeInsets.all(15.0),
                      height: 320.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(child: Icon(Icons.clear))),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Subject Name',
                                  isDense: true),
                              controller: nameController),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextField(
                            controller: creditController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Credit',
                                isDense: true),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Grade',
                                isDense: true),
                            controller: gradeController,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                subjectNames[index] =
                                    subjectNames[index] = DataModel(
                                  nameController.text,
                                  double.parse(creditController.text),
                                  double.parse(gradeController.text),
                                );
                              });
                              Navigator.pop(context);
                            },
                            color: Theme.of(context).primaryColor,
                            padding: EdgeInsets.all(8.0),
                            child: Text('Save'),
                          )
                        ],
                      )),
                );
              });
        },
        child: Icon(Icons.edit_outlined));
  }
}

class TextDataStyle extends StatelessWidget {
  final text;
  TextDataStyle({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    );
  }
}

class DataModel {
  final String subName;
  final double credit;
  final double grade;

  DataModel(this.subName, this.credit, this.grade);
}
