import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_theme.dart';
import '../../utils/size_config.dart';

class CustomInput<T> extends StatefulWidget {
  final T? value;
  final String? label;
  final Color? textColor;
  final TextCapitalization? textCapitalization;
  final Function(T?)? onChange;
  final void Function()? onEditComplete;
  final Function(T)? onFieldSubmitted;
  final String? placeholderText;
  final Color? placeholderColor;
  final IconData? leftIcon;
  final Color? bgColor;
  final IconButton? rightIconButton;
  final TextInputType? type;
  final String? errorMessage;
  final String? Function(String)? validation;
  final bool? required;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textFormatters;
  final AutovalidateMode? autoValidateMode;

  const CustomInput({
    super.key,
    this.value,
    this.label,
    this.textColor,
    this.textCapitalization,
    this.onChange,
    this.onEditComplete,
    this.onFieldSubmitted,
    this.placeholderText,
    this.placeholderColor,
    this.leftIcon,
    this.bgColor,
    this.rightIconButton,
    this.type,
    this.errorMessage,
    this.validation,
    this.required,
    this.controller,
    this.focusNode,
    this.textFormatters,
    this.autoValidateMode,
  });

  @override
  State<CustomInput<T>> createState() => _CustomInputState<T>();
}

class _CustomInputState<T> extends State<CustomInput<T>> {
  late T? value;
  late String? label;
  late Color? textColor;
  late TextCapitalization? textCapitalization;
  late Function(T?)? onChange;
  late void Function()? onEditComplete;
  late Function(T)? onFieldSubmitted;
  late String? placeholderText;
  late Color? placeholderColor;
  late IconData? leftIcon;
  late Color? bgColor;
  late IconButton? rightIconButton;
  late TextInputType? type;
  late String? errorMessage;
  late String? Function(String)? validation;
  late bool? required;
  late TextEditingController? controller;
  late FocusNode? focusNode;
  late List<TextInputFormatter>? textFormatters;
  late AutovalidateMode? autoValidateMode;
  late bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.type == TextInputType.visiblePassword;
    value = widget.value;
    label = widget.label;
    textColor = widget.textColor;
    textCapitalization = widget.textCapitalization;
    onChange = widget.onChange;
    onEditComplete = widget.onEditComplete;
    onFieldSubmitted = widget.onFieldSubmitted;
    placeholderText = widget.placeholderText;
    placeholderColor = widget.placeholderColor;
    leftIcon = widget.leftIcon;
    bgColor = widget.bgColor;
    rightIconButton = widget.rightIconButton;
    type = widget.type;
    errorMessage = widget.errorMessage;
    validation = widget.validation;
    required = widget.required;
    controller = widget.controller;
    focusNode = widget.focusNode;
    textFormatters = widget.textFormatters;
    autoValidateMode = widget.autoValidateMode;
  }

  final EdgeInsets marginContainer =
      EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginContainer,
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label ?? ""),
              if (required == true)
                const Text(
                  "*",
                  style: TextStyle(color: AppColors.red),
                )
            ],
          ),
          _textFormField(),
        ],
      ),
    );
  }

  Widget _textFormField() {
    return TextFormField(
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: textColor),
        hintText: placeholderText,
        hintStyle: TextStyle(color: placeholderColor),
        prefixIcon: leftIcon != null ? Icon(leftIcon) : null,
        suffixIcon: type == TextInputType.visiblePassword
            ? IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : (rightIconButton),
      ),
      keyboardType: type,
      obscureText: type == TextInputType.visiblePassword ? _isObscure : false,
      onChanged: onChange != null ? (value) => onChange!(value as T) : null,
      onEditingComplete: onEditComplete,
      onFieldSubmitted: onFieldSubmitted != null
          ? (value) => onFieldSubmitted!(value as T)
          : null,
      textCapitalization: TextCapitalization.words,
      validator: _validate,
      controller: controller,
      focusNode: focusNode,
      inputFormatters: textFormatters,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
    );
  }

  String? _validate(String? value) {
    if (required == true && (value == null || value.isEmpty)) {
      return errorMessage ?? 'Please enter some text';
    }
    return validation != null ? validation!(value!) : null;
  }
}
