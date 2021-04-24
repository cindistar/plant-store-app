import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/page_manager.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({this.iconData, this.title, this.page});

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().page;

    return Material(
      color: const Color(0xFFF5F5F5),
      child: InkWell(
        onTap: () {
          context.read<PageManager>().setPage(page);
          
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 23),
              child: Container(
                width: 67,
                height: 67,
                // ignore: sort_child_properties_last
                child: Icon(
                  iconData,
                  size: 33,
                  color: curPage == page
                      ? const Color(0xFF85E227)
                      : const Color(0xFFAFAAAA),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFC5B8B8),
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      offset: Offset(-5, -5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 30),
            SizedBox(
              height: 40,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: curPage == page ? const Color(0xFF85E227) : Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
