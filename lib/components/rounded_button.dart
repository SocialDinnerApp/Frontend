import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, disabledColor, textColor, disabledTextColor;
  final bool disabled;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.disabledColor = kPrimaryMediumColor,
    this.textColor = Colors.white,
    this.disabledTextColor = Colors.white,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
          color: disabled ? disabledColor : color,
          child: TextButton(
            onPressed: disabled ? null : press,
            child: Text(
              text,
              style: TextStyle(
                color: disabled ? disabledTextColor : textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
