import 'package:flutter/material.dart';
import 'package:my_app/theme/app_theme.dart';

class ProfileListTile extends StatefulWidget {
  /// The title of the list tile.
  final String? title;

  /// The subtitle of the list tile.
  final String subTitle;

  /// An optional widget to be displayed on the right side of the list tile.
  final Widget? childWidget;

  const ProfileListTile({
    super.key,
    this.title,
    required this.subTitle,
    this.childWidget,
  });

  @override
  State<ProfileListTile> createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: TextStyle(
                color: AppColors().grayDark,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.subTitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.childWidget != null) widget.childWidget!,
            ],
          ),
        ],
      ),
    );
  }
}
