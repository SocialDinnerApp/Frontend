import 'package:flutter/material.dart';
import 'package:socialdinner/components/text_field_container.dart';
import 'package:socialdinner/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hinttext,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: kPrimaryColor,
        ),
        hintText: hinttext,
        border: InputBorder.none,
      ),
    ));
  }
}
