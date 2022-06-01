// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:convo_1/theme.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class notifications_page extends StatefulWidget {
  const notifications_page({Key? key}) : super(key: key);

  @override
  State<notifications_page> createState() => _notifications_pageState();
}

class _notifications_pageState extends State<notifications_page> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 270,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardDark,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  size: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Theare are no new notifications',
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
