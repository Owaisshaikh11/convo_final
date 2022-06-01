// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class emptyMessage extends StatefulWidget {
  const emptyMessage({Key? key}) : super(key: key);

  @override
  State<emptyMessage> createState() => _emptyMessageState();
}

class _emptyMessageState extends State<emptyMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          // color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.only(right: 30, top: 180),
            child: SvgPicture.asset(
              'assets/images/no_Message.svg',
              height: 240,
              // width: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 180,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "It's Nice To Chat With Someone",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.6,
                        fontSize: 23,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Pick a Person by clicking the plus button below\n And Start Conversation  ",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.w400,
                        // letterSpacing: 1.1,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
