// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:animate_do/animate_do.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //* main container
        height: double.infinity,
        width: double.maxFinite,
        color: Color.fromARGB(255, 29, 25, 138),
        child: Stack(
          children: [
            // ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 750,
                width: 480,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(90),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffeeeeee),
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // top: 1,
                      left: 20,
                      child: FadeInDown(
                        duration: Duration(milliseconds: 900),
                        child: Image.asset(
                          'assets/images/pablita-680.png',
                          height: 290,
                          width: 430,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 270,
                      left: 165,
                      child: FadeInUp(
                        child: Text(
                          "REGISTER",
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 20, 17, 116),
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                          // textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 320,
                      left: 33,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FadeInDown(
                          child: Text(
                            'Enter your phone number to continue,We will send \n you a OTP to verify. ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              // fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //* This one is for the Phone no input panal
                      top: 420,
                      left: 33,
                      child: Stack(
                        children: [
                          JelloIn(
                            child: Container(
                              width: 400,
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.13),
                                ),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffeeeeee),
                                    blurRadius: 11,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: InternationalPhoneNumberInput(
                                maxLength: 10,
                                onInputChanged: (value) {},
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                selectorConfig: SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                    TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                inputDecoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15, left: 0),
                                  border: InputBorder.none,
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 98,
                            top: 8,
                            bottom: 8,
                            child: JelloIn(
                              child: Container(
                                height: 40,
                                width: 1,
                                color: Colors.black.withOpacity(0.13),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 560,
                      left: 67,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FadeInDown(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Request OTP',
                              style: GoogleFonts.poppins(
                                fontSize: 19,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 12, 36, 75),
                                minimumSize: Size(340, 50)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
