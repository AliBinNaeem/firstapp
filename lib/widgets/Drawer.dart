import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserPicture =
        "https://plugins.jetbrains.com/files/7385/84140/icon/META-INF_pluginIcon.png";
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero ,  // filhal no need,

        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("SMAli"),
              accountEmail: Text("smabn5@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(UserPicture),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.5,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
