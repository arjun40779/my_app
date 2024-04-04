import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class CustomListTile extends StatefulWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  const CustomListTile({super.key, this.leading, this.title, this.trailing});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  late Widget? leading;
  late Widget? title;
  late Widget? trailing;
  @override
  void initState() {
    super.initState();
    leading = widget.leading;
    title = widget.title;
    trailing = widget.trailing;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: AppColors.secondaryLight,
      highlightColor: AppColors.backgroungColor,
      child: ListTile(
        leading: leading,
        title: title,
        trailing: trailing,
      ),
    );
  }
}
