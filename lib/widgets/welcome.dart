// ignore_for_file: prefer_const_constructors

import 'package:convo_1/routes.dart';
import 'package:convo_1/screens/login_page.dart';
import 'package:convo_1/screens/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              //* This is the one that is overlapped with main container

              top: 37,
              left: 19,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(90),
                  topRight: Radius.circular(90),
                ),
                child: Container(
                  color: Color.fromARGB(255, 202, 201, 201),
                  height: 57,
                  width: 438,
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                // margin: EdgeInsets.only(top: 30),

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 245, 245),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(90),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.22),
                      spreadRadius: 9,
                      blurRadius: 15,
                      offset: Offset(0, 17),
                    ),
                  ],
                ),
                height: 450,
                width: 480,
                child: Stack(
                  children: [
                    Positioned(
                      top: 90,
                      left: 82,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          'WEL',
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 21, 18, 117),
                            fontSize: 99,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ?come text
                      top: 90,
                      left: -10,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          'COME.',
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 21, 18, 117),
                            fontSize: 99,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ?Tagline text
                      top: 310,
                      left: 210,
                      child: Text(
                        'Securely Spreading The\nWings Of Your Worlds 🛡️',
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 174, 170, 170),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      // ?Convo text
                      top: 380,
                      left: 322,
                      // bottom: 20,
                      child: Text(
                        'Convo',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 43,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ), // of main container
              ),
            ),
            Positioned(
              top: 650,
              left: 122,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 18, 117),
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 11,
                      bottom: 11,
                    ),
                    minimumSize: Size(257, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 251, 245, 189),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
