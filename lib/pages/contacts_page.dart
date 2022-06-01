// ignore_for_file: camel_case_types

import 'package:convo_1/screens/chat_screen.dart';
import 'package:convo_1/theme.dart';
import 'package:convo_1/widgets/display_error_message.dart';
import 'package:convo_1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:convo_1/app.dart';

class contactsPage extends StatelessWidget {
  const contactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: UserListCore(
            limit: 20,
            filter: Filter.notEqual('id', context.currentUser!.id),
            emptyBuilder: (context) {
              return const Center(child: Text('There are no users'));
            },
            loadingBuilder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error) {
              return DisplayErrorMessage(error: error);
            },
            listBuilder: (context, items) {
              return Scrollbar(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index].when(
                      headerItem: (_) => const SizedBox.shrink(),
                      userItem: (user) => _ContactTile(user: user),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  Future<void> createChannel(BuildContext context) async {
    // this method is creating A new chat channal in strem
    final core = StreamChatCore.of(context);
    final channel = core.client.channel('messaging', extraData: {
      'members': [
        core.currentUser!.id,
        user.id,
      ]
    });
    await channel.watch();

    Navigator.of(context).push(
      chatScreen.routeWithChannel(channel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        createChannel(context);
      },
      child: ListTile(
        // selectedTileColor: Colors.amber,
        leading: Avatar.small(url: user.image),
        title: Text(user.name),
      ),
    );
  }
}
