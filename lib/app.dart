import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as lg;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const streamKey = '5yhbt8c7zkc6';
var logger = lg.Logger();

// Extensions can be used to add functionality to the SDK.
extension StreamChatContext on BuildContext {
  /// Fetches the current user image.
  String? get currentUserImage => currentUser!.image;

  /// Fetches the current user.
  User? get currentUser => StreamChatCore.of(this).currentUser;
}
