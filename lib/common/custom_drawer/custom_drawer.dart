import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../common/custom_drawer/custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFF5F5F5),
        child: ListView(
          children: [
            CustomDrawerHeader(),
             const Divider(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: DrawerTile(
                iconData: FontAwesomeIcons.home,
                title: 'Home',
                page: 0,
              ),
            ),
            const DrawerTile(
              iconData: FontAwesomeIcons.leaf,
              title: 'Products',
              page: 1,
            ),
            const DrawerTile(
              iconData: FontAwesomeIcons.stickyNote,
              title: 'My orders',
              page: 2,
            ),
            const DrawerTile(
              iconData: FontAwesomeIcons.cog,
              title: 'Admin',
              page: 3,
            ),
          ],
        ),
      ),
    );
  }
}