import 'package:convo_1/screens/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

final TextEditingController phonNo = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    // final phonNo = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 252),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "welcome",
                    style: TextStyle(color: Color.fromARGB(255, 160, 159, 166)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text("Fill the form to become our guest",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Color.fromARGB(255, 56, 56, 74))),
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: const Color.fromRGBO(20, 17, 116, .3),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              )
                            ]),
                        child: Stack(
                          children: [
                            InternationalPhoneNumberInput(
                              textFieldController: phonNo,
                              textStyle: GoogleFonts.poppins(
                                color: Colors.grey.shade600,
                              ),

                              onInputChanged: (value) {},
                              cursorColor: Colors.black,
                              // ignoreBlank: true,
                              selectorTextStyle:
                                  TextStyle(color: Colors.grey.shade500),
                              inputDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    bottom: 12, left: -30),
                                border: InputBorder.none,
                                hintText: '(900)  000  0000',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 16),
                              ),
                            ),
                            Positioned(
                              left: 90,
                              top: 8,
                              bottom: 8,
                              child: Container(
                                height: 40,
                                width: 1,
                                color: Colors.black.withOpacity(0.13),
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 120),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 35, 35, 59),
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            onPressed: () {
                              print(phonNo.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTPCard(
                                    phone: phonNo.text,
                                  ),
                                ),
                              );
                              // print(phonNo.text);
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          "Next",
                          style:
                              TextStyle(color: Color.fromARGB(255, 68, 68, 70)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
