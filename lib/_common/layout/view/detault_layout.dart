import 'package:flutter/material.dart';

class DetaultLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final bool? isBackButtonEnabled;

  const DetaultLayout({
    super.key,
    required this.child,
    required this.title,
    this.isBackButtonEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            isBackButtonEnabled ?? false,
        centerTitle: false,
        backgroundColor: Colors.black,
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: child,
    );
  }
}
