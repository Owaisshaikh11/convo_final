// ignore_for_file: deprecated_member_use

import 'package:convo_1/routes.dart';
import 'package:convo_1/screens/home_screen.dart';
import 'package:convo_1/screens/login_page.dart';
import 'package:convo_1/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_core/firebase_core.dart';

class OTPCard extends StatefulWidget {
  OTPCard({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  State<OTPCard> createState() => _OTPCardState();
}

class _OTPCardState extends State<OTPCard> {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String verificationCode = '1';
  final defaultPinTheme = PinTheme(
    width: 74,
    height: 60,
    textStyle: GoogleFonts.poppins(
        fontSize: 20, color: const Color.fromRGBO(70, 69, 66, 1)),
    decoration: BoxDecoration(
      color: const Color.fromARGB(
          94, 153, 157, 165), // color of default box when unfocused
      borderRadius: BorderRadius.circular(21),
    ),
  );

  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
  @override
  // final a = phonNo;
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: const Color.fromARGB(255, 247, 246, 252),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "verification",
                    style: TextStyle(
                        color: Color.fromARGB(
                            255, 160, 159, 166)), //rgb(160,159,166)
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "We sent you an SMS code",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: Color.fromARGB(255, 56, 56, 74)),
                  ),
                  Row(
                    children: [
                      const Text(
                        "On number:",
                        style: TextStyle(
                          color: Color.fromARGB(255, 121, 121, 133),
                          fontSize: 13,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          phonNo.text,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 114, 111, 187),
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // code for otp boxes goes heare

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Pinput(
                        length: 6,
                        controller: controller, // controller for otp
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        separator: const SizedBox(
                            width:
                                18), // This LOC is for the space between textboxes
                        focusedPinTheme: defaultPinTheme.copyWith(
                          // decoration for focused state
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.05999999865889549),
                                offset: Offset(0, 3),
                                blurRadius: 16,
                              )
                            ],
                          ),
                        ),
                        onSubmitted: (pin) async {
                          // this will be used if the sim is not persent on phone
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                              PhoneAuthProvider.credential(
                                  verificationId: verificationCode,
                                  smsCode: pin),
                            )
                                .then((value) async {
                              if (value.user != null) {
                                print('pass to home');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => home_screen()),
                                );
                              }
                            });
                          } catch (e) {
                            FocusScope.of(context).unfocus();
                            scaffoldkey.currentState?.showSnackBar(
                              const SnackBar(
                                content: Text('Invalid OTP'),
                              ),
                            );
                          }
                        },

                        showCursor: true,
                        cursor: cursor,
                      ),
                    ),
                    // RoundedWithShadow(), //itcomes from screens/rounded_with_shadow.dart
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Center(
                child: TextButton(
                  child: const Text(
                    "Code not received?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 114, 111, 187),
                        fontSize: 13),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 35, 59),
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => home_screen()),
                    // );
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  verifynumber() async {
    // this Method will auto verify the otp

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            print('User Logged In');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home_screen()),
            );
          } else {}
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print('The Error Is while verification is ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          verificationCode = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  void initState() {
    super.initState();
    verifynumber();
  }
}
