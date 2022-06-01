import 'package:convo_1/screens/profile_screen.dart';
import 'package:convo_1/theme.dart';
import 'package:convo_1/widgets/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convo_1/screens/screens.dart';
import 'package:convo_1/widgets/widgets.dart';
import 'package:convo_1/helpers.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:convo_1/app.dart';
import '../widgets/glowing_action_button.dart';

class home_screen extends StatefulWidget {
  home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

final ValueNotifier<int> pageIndex = ValueNotifier(0);
final ValueNotifier<String> titleText = ValueNotifier('Messages');

class _home_screenState extends State<home_screen> {
  final pages = const [
    message_page(),
    notifications_page(),
    calls_page(),
    contactsPage(),
  ];

  void onNavItemSelected(index) {
    pageIndex.value = index;
    titleText.value = pageText[index];
  }

  final pageText = const ['Messages', 'Notifications', 'Calls', 'Contacts'];

  @override
  Widget build(BuildContext context) {
    // StreamChatCore.of(context).client;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
          // this is for Refreshing the app (rerender)
          builder: (BuildContext context, String value, _) {
            return Text(
              pageText[pageIndex.value],
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            );
          },
          valueListenable: titleText,
        ),
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Hero(
              tag: 'hero-profile-picture',
              child: Avatar.small(
                url: context.currentUserImage,
                onTap: () {
                  Navigator.of(context).push(ProfileScreen.route);
                },
              ),
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _bottomNavBar(
        onItemSelected: onNavItemSelected,
      ),
    );
  }
}

class _bottomNavBar extends StatefulWidget {
  const _bottomNavBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<_bottomNavBar> {
  var selectedindex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedindex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ), // cliprrect is for the border radious of bottom nav bar
      child: Card(
        color: (brightness == Brightness.light) ? Colors.transparent : null,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navBarItem(
                  icon: CupertinoIcons.bubble_left_bubble_right_fill,
                  label: 'Message',
                  index: 0,
                  isSelected: (selectedindex == 0),
                  onTap: handleItemSelected,
                ),
                navBarItem(
                  icon: CupertinoIcons.bell_solid,
                  label: 'Notifications',
                  index: 1,
                  isSelected: (selectedindex == 1),
                  onTap: handleItemSelected,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GlowingActionButton(
                      color: AppColors.secondary,
                      icon: CupertinoIcons.add,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => const Dialog(
                            child: AspectRatio(
                              aspectRatio: 8 / 6,
                              child: contactsPage(),
                            ),
                          ),
                        );
                      }),
                ),
                navBarItem(
                  icon: CupertinoIcons.phone_fill,
                  label: 'Calls',
                  index: 2,
                  isSelected: (selectedindex == 2),
                  onTap: handleItemSelected,
                ),
                navBarItem(
                  icon: CupertinoIcons.person_2_fill,
                  label: 'Contacts',
                  index: 3,
                  onTap: handleItemSelected,
                  isSelected: (selectedindex == 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class navBarItem extends StatelessWidget {
  navBarItem(
      {Key? key,
      required this.icon,
      required this.label,
      required this.index,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);

  final String label;
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .opaque, // content takes all space Around it, it fixes the issue when we need to click only on content
      onTap: () {
        onTap(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: 2), // padding for bottom nav bar
        child: SizedBox(
          width: 73,
          // height: 70,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 23,
                color: isSelected
                    ? AppColors.secondary
                    : null, // checking whether the icon is selected or not
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                label,
                style: isSelected
                    ? const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      )
                    : const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
