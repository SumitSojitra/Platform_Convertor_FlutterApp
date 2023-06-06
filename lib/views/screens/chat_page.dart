import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/platform_providers.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(CupertinoIcons.home),
          middle: Text("Platform Convertor"),
          trailing: CupertinoSwitch(
            onChanged: (val) {
              Provider.of<Platform_Provider>(context, listen: false)
                  .changeSwitch(val);
            },
            value: Provider.of<Platform_Provider>(context, listen: false).switc,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: (Globals.iosDetails.isEmpty)
              ? Text("No any Chats yet...")
              : ListView.builder(
                  itemCount: Globals.iosDetails.length,
                  itemBuilder: (context, i) {
                    return CupertinoListTile(
                      leading: CircleAvatar(),
                      title: Text("${Globals.iosDetails[i].name}"),
                      subtitle: Text(
                          "${Globals.iosDetails[i].number}\n${Globals.iosDetails[i].chat}"),
                    );
                  }),
        ));
  }
}
