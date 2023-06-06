import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/platform_providers.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
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
              ? Text("No any Calls yet...")
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
