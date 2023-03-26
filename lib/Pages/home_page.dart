import 'package:firstapp/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App title"),
      ),
      body: Center(
        child: Container(
          child: Text("Wellcome to course days"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
