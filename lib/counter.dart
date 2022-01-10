import 'package:flutter/material.dart';

import 'box.dart';
import 'button.dart';
import 'utils/color_manager.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int number = 0;
  int plus = 0;
  int minus = 0;

  List<Color> colors = ColorManager.colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors[number % colors.length],
        title: Text(
          'Timepass With Colorful Counter',
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.plus_one),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.calculate),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              '$number',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  color: colors[plus % colors.length],
                  text: 'Increment',
                  onPressed: () {
                    setState(() {
                      number++;
                      plus++;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Button(
                  color: colors[minus % colors.length],
                  text: 'Decrement',
                  onPressed: () {
                    if (number > 0) {
                      setState(() {
                        number--;
                      });
                    }
                    minus++;
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                for (int i = 1; i <= number; i++)
                  Box(
                    number: i,
                    color: colors[i % colors.length],
                  ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
