
import 'package:flutter/material.dart';
import 'package:mynews_app/const/styling.dart';


class appbar extends StatelessWidget implements PreferredSizeWidget {
  final leading;
  final trailing;
  final title;
  const appbar({super.key, this.leading, this.trailing ,this.title});

  Widget build(BuildContext context) {
    return AppBar(
      actions:[trailing],
      title: title,
      backgroundColor:texttheme,
      leading:leading,
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
