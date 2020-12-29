import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hint,
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.textInputType,
    this.onChanged,
    this.onSubmitted,
    this.enabled,
    this.controller,
    this.borderRadius,
    this.cursorColor,
  });

  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function onChanged;
  final Function onSubmitted;
  final bool enabled;
  final double borderRadius;
  final Color cursorColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      //height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        enabled: enabled,
        cursorColor: cursorColor ?? colorScheme.onPrimary.withOpacity(0.5),
        style: textTheme.subtitle2.apply(color: colorScheme.onPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textTheme.subtitle2.apply(color: colorScheme.onPrimary.withOpacity(0.5)), //TextStyle(color: Theme.of(context).accentColor.withOpacity(0.5), fontSize: 16),
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
