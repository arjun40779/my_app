import 'package:flutter/material.dart';
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
    this.bgColor = Colors.blue,
    this.textColor,
    this.leftIcon,
    this.rightIcon,
    this.variant = ButtonVariant.solid,
    this.size = ButtonSize.regular,
    this.disabled = false,
    this.loading = false,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final Color linkColor = const Color.fromARGB(255, 51, 16, 193);
  @override
  Widget build(BuildContext context) {
    // responsibe heiht and widht
    //default button setup -- regular
    bool isButtonPressed = widget.disabled;
    Color buttonColor = widget.bgColor ?? Colors.blue;
    Color buttonTextColor = widget.textColor ?? Colors.white;
    double fontSize = SizeConfig.textMultiplier * 3;
    double width = SizeConfig.widthMultiplier * 60;
    BorderSide buttonBorderSide = const BorderSide(color: Colors.transparent);
    TextDecoration decoration = TextDecoration.none;
    final double sizedBoxWidth = SizeConfig.widthMultiplier * 2;

// bgcolor text color and outline setup for different variants of buttons
    switch (widget.variant) {
      //Outlined
      case ButtonVariant.outline:
        buttonColor = Colors.transparent;
        buttonTextColor = widget.textColor ?? widget.bgColor ?? Colors.black;
        buttonBorderSide = BorderSide(color: widget.bgColor ?? Colors.black);
        break;
      //link
      case ButtonVariant.link:
        buttonColor = Colors.transparent;
        decoration = TextDecoration.underline;
        buttonTextColor = widget.textColor ?? linkColor;
        break;

      default:
        break;
    }
// font size and width setup for different Button sizes
    switch (widget.size) {
      //Small
      case ButtonSize.small:
        fontSize = SizeConfig.textMultiplier * 2;
        width = SizeConfig.widthMultiplier * 40;
        break;
      //large
      case ButtonSize.large:
        fontSize = SizeConfig.textMultiplier * 4;
        width = SizeConfig.widthMultiplier * 20;
        break;
      //block
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
              backgroundColor: MaterialStateProperty.all<Color>(
                  buttonColor), // Set background color
              side: MaterialStateProperty.all<BorderSide>(buttonBorderSide)),
          child: Row(
            children: [
              if (widget.leftIcon != null)
                Icon(
                  widget.leftIcon,
                  size: fontSize,
                  color: buttonTextColor,
                ),
              if (widget.leftIcon != null) SizedBox(width: sizedBoxWidth),
              Expanded(
                child: Text(
                  widget.text,
                  style: TextStyle(
                      color: buttonTextColor,
                      decoration: decoration,
                      fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),
              if (widget.rightIcon != null) SizedBox(width: sizedBoxWidth),
              if (widget.rightIcon != null)
                Icon(
                  widget.rightIcon,
                  size: fontSize,
                  color: buttonTextColor,
                ),
            ],
          ),
        ));
  }
}
