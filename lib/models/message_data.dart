import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

@immutable
class MessageData {
  MessageData(
      {required this.sennderName,
      required this.message,
      required this.messageDate,
      required this.dateMessage,
      required this.profilePicture});
  final String sennderName;
  final String message;
  final DateTime messageDate;
  final String dateMessage;
  final String profilePicture;
}
