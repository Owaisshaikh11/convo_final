import 'package:flutter/material.dart';

class notifications_page extends StatefulWidget {
  const notifications_page({Key? key}) : super(key: key);

  @override
  State<notifications_page> createState() => _notifications_pageState();
}

class _notifications_pageState extends State<notifications_page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notifications'),
    );
  }
}
