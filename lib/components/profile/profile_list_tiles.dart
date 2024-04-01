import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '/utils/size_config.dart';

class ProfileListTile extends StatefulWidget {
  final String? title;
  final String subTitle;
  final Widget? child;

  const ProfileListTile({
    super.key,
    this.title,
    required this.subTitle,
    this.child,
  });

  @override
  State<ProfileListTile> createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  late double paddingVertical;
  late double paddingHorizontal;
  late double titleFontSize;
  late FontWeight titleFontWeight;
  late double subTitleFontSize;
  late FontWeight subTitleFontWeight;
  late double borderWidth;

  @override
  void initState() {
    super.initState();
    paddingVertical = SizeConfig.heightMultiplier * 2;
    paddingHorizontal = SizeConfig.widthMultiplier * 4;
    titleFontSize = SizeConfig.textMultiplier * 4;
    titleFontWeight = FontWeight.w400;
    subTitleFontSize = SizeConfig.textMultiplier * 4;
    subTitleFontWeight = FontWeight.bold;
    borderWidth = SizeConfig.textMultiplier * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey, // Border color
            width: borderWidth, // Border width
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
                color: AppColors.greyDark,
                fontSize: titleFontSize,
                fontWeight: titleFontWeight,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.subTitle,
                style: TextStyle(
                  fontSize: subTitleFontSize,
                  fontWeight: subTitleFontWeight,
                ),
              ),
              if (widget.child != null) widget.child!,
            ],
          ),
        ],
      ),
    );
  }
}
