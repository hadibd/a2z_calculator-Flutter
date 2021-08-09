import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              child: TabBar(
                indicator: BoxDecoration(color: Colors.deepOrangeAccent),
                tabs: [
                  Text('1'),
                  Text('2'),
                ],
              ),
            ),
            SizedBox(height: 300, child: TabBarView(children: [One(), Two()]))
          ],
        ),
      ),
    );
  }
}

class One extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('One'),
      ),
    );
  }
}

class Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Two'),
      ),
    );
  }
}
