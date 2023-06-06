import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/model/model.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../providers/platform_providers.dart';

class android extends StatefulWidget {
  const android({Key? key}) : super(key: key);

  @override
  State<android> createState() => _androidState();
}

class _androidState extends State<android> {
  PageController pageController = PageController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController chatController = TextEditingController();

  String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Platform Convertor"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {},
        ),
        actions: [
          Switch(
            onChanged: (val) {
              Provider.of<Platform_Provider>(context, listen: false)
                  .changeSwitch(val);
            },
            value: Provider.of<Platform_Provider>(context, listen: false).switc,
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      foregroundImage: (Provider.of<Platform_Provider>(context,
                                      listen: false)
                                  .img !=
                              null)
                          ? FileImage(
                              Provider.of<Platform_Provider>(context).img!)
                          : null,
                      radius: 70,
                    ),
                    IconButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.camera);

                          Provider.of<Platform_Provider>(context, listen: false)
                              .imagePick(
                            File(image!.path),
                          );
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                        ))
                  ],
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) return "First Enter Full Name";
                            null;
                          },
                          controller: nameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Full Name",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) return "First Enter Phone Number";
                            null;
                          },
                          controller: numController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: "Phone Number",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty)
                              return "First Enter Chat Conversation";
                            null;
                          },
                          controller: chatController,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.chat),
                              hintText: "Chat Conversation",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                Globals.alldetail.add(
                                  allInformation(
                                      name: nameController.text,
                                      number: numController.text,
                                      chat: chatController.text),
                                );
                              }
                            },
                            child: Text("SAVE"))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: (Globals.alldetail.isEmpty)
                ? Text("You Have no Chat yet...")
                : ListView.builder(
                    itemCount: Globals.alldetail.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: CircleAvatar(),
                        title: Text("${Globals.alldetail[i].name}"),
                        subtitle: Text("${Globals.alldetail[i].chat}"),
                      );
                    }),
          ),
          Container(
            alignment: Alignment.center,
            child: (Globals.alldetail.isEmpty)
                ? Text("You Have no Call yet...")
                : ListView.builder(
                    itemCount: Globals.alldetail.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: CircleAvatar(),
                        title: Text("${Globals.alldetail[i].name}"),
                        subtitle: Text("${Globals.alldetail[i].chat}"),
                      );
                    }),
          ),
          Container(
              child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                title: Text("Profile"),
                subtitle: Text("Update Profile Data"),
                trailing: Switch(
                    onChanged: (val) {
                      Provider.of<Platform_Provider>(context, listen: false)
                          .Profile(val);
                    },
                    value: Provider.of<Platform_Provider>(context).profile),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.sunny,
                  color: Colors.grey,
                ),
                title: Text("Theme"),
                subtitle: Text("Change Theme"),
                trailing: Switch(
                    onChanged: (val) {
                      Provider.of<Platform_Provider>(context, listen: false)
                          .Theme(val);
                    },
                    value: Provider.of<Platform_Provider>(context).theme),
              ),
            ],
          )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        currentIndex: Provider.of<Platform_Provider>(context).page,
        onTap: (val) {
          Provider.of<Platform_Provider>(context, listen: false)
              .changePage(val);
          pageController.jumpToPage(val);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_add_sharp,
              ),
              label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.phone,
              ),
              label: "Calls"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings")
        ],
      ),
    );
  }
}
