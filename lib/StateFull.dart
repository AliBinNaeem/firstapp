import 'package:flutter/material.dart';

class StateFull extends StatefulWidget {
  const StateFull({Key? key}) : super(key: key);

  @override
  State<StateFull> createState() => _StateFullState();
}

class _StateFullState extends State<StateFull> {
  int _Counter = 0;
  void Increment() {
    setState(() {
      _Counter++;
      print(_Counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: ElevatedButton(
            onPressed: () {
              Increment();
            },
            child: Text("Pressed me"),
          ),
        ),
      ),
    );
  }
}
