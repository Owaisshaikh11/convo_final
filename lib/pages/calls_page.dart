import 'package:flutter/material.dart';

class calls_page extends StatefulWidget {
  const calls_page({Key? key}) : super(key: key);

  @override
  State<calls_page> createState() => _calls_pageState();
}

class _calls_pageState extends State<calls_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('calls'),
      ),
    );
  }
}
