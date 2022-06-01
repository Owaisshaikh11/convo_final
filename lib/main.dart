// ignore: duplicate_ignore
// ignore_for_file: camel_case_types, duplicate_ignore

// ignore_for_file: camel_case_types

import 'package:convo_1/app.dart';
import 'package:convo_1/routes.dart';
import 'package:convo_1/screens/otp_page.dart';
import 'package:convo_1/screens/screens.dart';
import 'package:convo_1/screens/select_user_screen.dart';
import 'package:convo_1/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final client = StreamChatClient(streamKey);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // Its For making the status bar transparent
    statusBarColor: Colors.transparent,
  ));

  runApp(myapp(
    client: client,
  ));
}

class myapp extends StatelessWidget {
  const myapp({Key? key, required this.client}) : super(key: key);
  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convo',
      home: const SelectUserScreen(),
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,

      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,

      builder: (context, child) {
        return StreamChat(
          client: client,
          streamChatThemeData:
              StreamChatThemeData(colorTheme: ColorTheme.dark()),
          child: UsersBloc(
            child: ChannelsBloc(child: child!),
          ),
        );
      },

      // initialRoute: MyRoute.welcomePage,
      routes: {
        // "/": (context) => const welcome(),
        MyRoute.loginPage: (context) => login(),
        MyRoute.otpCard: (context) => OTPCard(
              phone: phonNo.text,
            ),
        MyRoute.welcomePage: (context) => home_screen(),
      },
    );
  }
}
