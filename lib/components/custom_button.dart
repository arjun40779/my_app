import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '/utils/size_config.dart';

enum ButtonVariant { solid, outline, link }

enum ButtonSize { small, regular, large, block }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? textColor;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool disabled;
  final bool loading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = AppColors.secondary,
    this.textColor,
    this.leftIcon,
    this.rightIcon,
    this.variant = ButtonVariant.solid,
    this.size = ButtonSize.regular,
    this.disabled = false,
    this.loading = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final Color linkColor = AppColors.blue;

  @override
  Widget build(BuildContext context) {
    bool isButtonPressed = widget.disabled;
    Color buttonColor = widget.bgColor ?? Colors.blue;
    Color buttonTextColor = widget.textColor ?? Colors.white;
    double fontSize = SizeConfig.textMultiplier * 4.5;
    double width = SizeConfig.widthMultiplier * 60;
    BorderSide buttonBorderSide = const BorderSide(color: Colors.transparent);
    TextDecoration decoration = TextDecoration.none;

    // Set up button appearance based on variant
    switch (widget.variant) {
      case ButtonVariant.outline:
        buttonColor = Colors.transparent;
        buttonTextColor = widget.textColor ?? widget.bgColor ?? Colors.black;
        buttonBorderSide = BorderSide(color: widget.bgColor ?? Colors.black);
        break;
      case ButtonVariant.link:
        buttonColor = Colors.transparent;
        decoration = TextDecoration.underline;
        buttonTextColor = widget.textColor ?? linkColor;
        break;
      default:
        break;
    }

    // Set up button size
    switch (widget.size) {
      case ButtonSize.small:
        fontSize = SizeConfig.textMultiplier * 3;
        width = SizeConfig.widthMultiplier * 30;
        break;
      case ButtonSize.large:
        fontSize = SizeConfig.textMultiplier * 4;
        width = SizeConfig.widthMultiplier * 40;
        break;
      case ButtonSize.block:
        fontSize = SizeConfig.textMultiplier * 4;
        break;
      default:
        break;
    }

    return SizedBox(
      width: widget.size == ButtonSize.block ? null : width,
      child: TextButton(
        onPressed: isButtonPressed
            ? null
            : () {
                widget.onPressed();
                setState(() {
                  isButtonPressed = true;
                });
              },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          side: MaterialStateProperty.all<BorderSide>(buttonBorderSide),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.leftIcon != null
                ? Icon(
                    widget.leftIcon,
                    size: fontSize,
                    color: buttonTextColor,
                  )
                : SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
            Text(
              widget.text,
              style: TextStyle(
                color: buttonTextColor,
                decoration: decoration,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.center,
            ),
            widget.rightIcon != null
                ? Icon(
                    widget.rightIcon,
                    size: fontSize,
                    color: buttonTextColor,
                  )
                : SizedBox(
                    width: SizeConfig.widthMultiplier * 3,
                  ),
          ],
        ),
      ),
    );
  }
}
