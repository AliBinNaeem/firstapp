import 'package:firstapp/StateFull.dart';
import 'package:firstapp/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Myapp()));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
