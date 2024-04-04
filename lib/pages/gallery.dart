import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';
import '../utils/size_config.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final String svgPath = "assets/diamond-4.svg";
  final double cardElevetion = SizeConfig.heightMultiplier * 2;
  double svgWidth = SizeConfig.widthMultiplier * 40;
  double svgHeight = SizeConfig.heightMultiplier * 25;
  bool large = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Durations.long2,
        curve: Curves.easeInOut,
        width: svgWidth,
        height: svgHeight,
        child: GestureDetector(
          onTap: () {
            setState(() {
              svgHeight = large ? svgHeight / 2 : svgHeight * 2;
              svgWidth = large ? svgWidth / 2 : svgWidth * 2;
              large = !large;
            });
          },
          child: Card(
            color: AppColors.backgroungColor,
            elevation: cardElevetion,
            child: SvgPicture.asset(
              svgPath,
              color: AppColors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
