import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color highlightColor;
  final Color textColor;
  final Color color;
  final double fontSize;
  final double borderRadius;

  const CustomRaisedButton({
    Key key,
    this.onPressed,
    this.text,
    this.highlightColor,
    this.textColor,
    this.color,
    this.fontSize,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 18),
        side: BorderSide(
          color: colorScheme.primary,
        ),
      ),
      onPressed: onPressed,
      color: color ?? colorScheme.primary,
      highlightColor: highlightColor ?? colorScheme.primary,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: textTheme.button.copyWith(color: Colors.white, fontSize: fontSize ?? 12.0), //(fontSize: 12),
        maxLines: 1,
      ),
    );
  }
}
