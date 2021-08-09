import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar(this.titleText);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      centerTitle: true,
      actions: [
        Icon(Icons.camera_alt_outlined),
        SizedBox(
          width: 15.0,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55.0);
}
