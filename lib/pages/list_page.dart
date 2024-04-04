import 'package:flutter/material.dart';
import '../components/my_app_bar.dart';
import '../components/profile/list_tile.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Menu",
      ),
      body: Center(
        child: ListView(
          children: const [
            CustomListTile(
              leading: Icon(Icons.home),
              title: Text("Profile"),
              trailing: Icon(Icons.more_vert),
            ),
            CustomListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              trailing: Icon(Icons.more_vert),
            ),
            CustomListTile(
              leading: Icon(Icons.message),
              title: Text("Message"),
              trailing: Icon(Icons.more_vert),
            ),
            CustomListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
              trailing: Icon(Icons.more_vert),
            ),
            CustomListTile(
              leading: Icon(Icons.photo_album),
              title: Text("Gallery"),
              trailing: Icon(Icons.more_vert),
            )
          ],
        ),
      ),
    );
  }
}
