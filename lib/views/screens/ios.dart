import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/views/screens/calls_page.dart';
import 'package:platform_convertor/views/screens/chat_page.dart';
import 'package:platform_convertor/views/screens/ios_add.dart';
import 'package:platform_convertor/views/screens/settings_page.dart';
import 'package:provider/provider.dart';

import '../../providers/platform_providers.dart';

class iphone extends StatefulWidget {
  const iphone({Key? key}) : super(key: key);

  @override
  State<iphone> createState() => _iphoneState();
}

class _iphoneState extends State<iphone> {
  List<Widget> pages = [AddPage(), ChatPage(), CallsPage(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, i) => CupertinoTabView(
        builder: (BuildContext) {
          return pages[i];
        },
      ),
      tabBar: CupertinoTabBar(
        onTap: (val) {
          Provider.of<Platform_Provider>(context, listen: false)
              .changePage(val);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_badge_plus), label: "profile"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2), label: "CHATS"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: "CALLS"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: "SETTINGS"),
        ],
      ),
    );
    // return CupertinoPageScaffold(
    //   navigationBar: CupertinoNavigationBar(
    //     leading: Icon(CupertinoIcons.home),
    //     middle: Text("Platform Convertor"),
    //     trailing: CupertinoSwitch(
    //       onChanged: (val) {
    //         Provider.of<Platform_Provider>(context, listen: false)
    //             .changeSwitch(val);
    //       },
    //       value: Provider.of<Platform_Provider>(context, listen: false).switc,
    //     ),
    //   ),
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Spacer(),
    //         CupertinoTabBar(
    //             currentIndex: Provider.of<Platform_Provider>(context).page,
    //             onTap: (val) {
    //               Provider.of<Platform_Provider>(context, listen: false)
    //                   .changePage(val);
    //             },
    //             items: <BottomNavigationBarItem>[
    //               BottomNavigationBarItem(
    //                   icon: Icon(CupertinoIcons.person_badge_plus),
    //                   label: "profile"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(CupertinoIcons.chat_bubble_2), label: "CHATS"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(CupertinoIcons.phone), label: "CALLS"),
    //               BottomNavigationBarItem(
    //                   icon: Icon(CupertinoIcons.settings), label: "SETTINGS"),
    //             ])
    //       ],
    //     ),
    //   ),
    // );
  }
}
