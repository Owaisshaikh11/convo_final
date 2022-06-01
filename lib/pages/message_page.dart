// ignore_for_file: camel_case_types

import 'package:convo_1/app.dart';
import 'package:convo_1/helpers.dart';
import 'package:convo_1/pages/empty_messagePage.dart';
import 'package:convo_1/screens/screens.dart';
import 'package:convo_1/widgets/unread_indicator.dart';
import 'package:flutter/material.dart';
import 'package:convo_1/theme.dart';
import 'package:convo_1/models/models.dart';
import 'package:convo_1/widgets/widgets.dart';
import 'package:faker/faker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
// import 'package:convo_1/helpers.dart';
import '../widgets/display_error_message.dart';

class message_page extends StatefulWidget {
  const message_page({Key? key}) : super(key: key);

  @override
  State<message_page> createState() => _message_pageState();
}

final channelListController = ChannelListController();

class _message_pageState extends State<message_page> {
  @override
  Widget build(BuildContext context) {
    return ChannelListCore(
      filter: Filter.and(
        [
          Filter.equal('type', 'messaging'),
          Filter.in_('members', [
            StreamChatCore.of(context).currentUser!.id,
          ])
        ],
      ),
      channelListController: channelListController,
      errorBuilder: (context, error) => DisplayErrorMessage(
        error: error,
      ),
      emptyBuilder: (context) => const Center(
        child: emptyMessage(),
      ),
      loadingBuilder: (
        context,
      ) =>
          const Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(),
        ),
      ),
      listBuilder: (context, channels) {
        return CustomScrollView(
          //it is used for applying different scrolling effect such as horizontal,vertical.
          slivers: [
            const SliverToBoxAdapter(
              // story section
              child: _stories(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _messageTile(channel: channels[index]);
                },
                childCount: channels.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _messageTile extends StatelessWidget {
  const _messageTile({Key? key, required this.channel}) : super(key: key);
  final Channel channel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          chatScreen.routeWithChannel(channel),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Avatar.medium(
              url: Helpers.getChannelImage(channel, context.currentUser!),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    Helpers.getChannelName(channel, context.currentUser!),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        letterSpacing: 0.2,
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: _buildLastMessage(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 4,
                ),
                _buildLastMessageAt(),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: UnreadIndicator(channel: channel),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastMessage() {
    return BetterStreamBuilder<int>(
      stream: channel.state!.unreadCountStream,
      initialData: channel.state?.unreadCount ?? 0,
      builder: (context, count) {
        return BetterStreamBuilder<Message>(
          stream: channel.state!.lastMessageStream,
          initialData: channel.state!.lastMessage,
          builder: (context, lastMessage) {
            return Text(
              lastMessage.text ?? '',
              overflow: TextOverflow.ellipsis,
              style: (count > 0)
                  ? const TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                    )
                  : const TextStyle(
                      fontSize: 12,
                      color: AppColors.textFaded,
                    ),
            );
          },
        );
      },
    );
  }

  Widget _buildLastMessageAt() {
    return BetterStreamBuilder<DateTime>(
      stream: channel.lastMessageAtStream,
      initialData: channel.lastMessageAt,
      builder: (context, data) {
        final lastMessageAt = data.toLocal();
        String stringDate;
        final now = DateTime.now();

        final startOfDay = DateTime(now.year, now.month, now.day);

        if (lastMessageAt.millisecondsSinceEpoch >=
            startOfDay.millisecondsSinceEpoch) {
          stringDate = Jiffy(lastMessageAt.toLocal()).jm;
        } else if (lastMessageAt.millisecondsSinceEpoch >=
            startOfDay
                .subtract(const Duration(days: 1))
                .millisecondsSinceEpoch) {
          stringDate = 'YESTERDAY';
        } else if (startOfDay.difference(lastMessageAt).inDays < 7) {
          stringDate = Jiffy(lastMessageAt.toLocal()).EEEE;
        } else {
          stringDate = Jiffy(lastMessageAt.toLocal()).yMd;
        }
        return Text(
          stringDate,
          style: const TextStyle(
            fontSize: 11,
            letterSpacing: -0.2,
            fontWeight: FontWeight.w600,
            color: AppColors.textFaded,
          ),
        );
      },
    );
  }
}

class _stories extends StatelessWidget {
  const _stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
            child: Text(
              "Stories",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textFaded),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final faker = Faker();
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 1, 12, 0),
                  child: SizedBox(
                    width: 60,
                    child: _StoryCard(
                        storyData: StoryData(
                            name: faker.person
                                .name(), //it is generating random names using faker package
                            url: Helpers
                                .randomPictureUrl())), //it is generating random images using this Helpers class
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
