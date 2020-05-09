
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainHeaderAppBar extends AppBar {
  final String headerTitle;
  final BuildContext context;

  MainHeaderAppBar(this.context, this.headerTitle) : super(
    title: Text(headerTitle),
    elevation: 0,
    bottom: TabBar(
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
          color: Theme.of(context).scaffoldBackgroundColor),
      tabs: <Widget>[
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("APPS"),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("APPS"),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("APPS"),
          ),
        ),
      ],
    )
  );
}


class MainRightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor
              ),
              child: Text(
                'Drawer Header',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        )
    );
  }
}