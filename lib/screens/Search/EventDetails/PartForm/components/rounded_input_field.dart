import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';

class RoundedInputField extends StatelessWidget {
  final double width;
  final String hinttext;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hinttext,
    required this.onChanged,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        width: width,
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hinttext,
            border: InputBorder.none,
            hintStyle: TextStyle(fontSize: 13),
            isDense: true,
          ),
          style: TextStyle(fontSize: 13),
        ),);
  }
}

class TextFieldContainer extends StatelessWidget {
  final double width;
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5,),
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.5,
          color: kPrimaryColor,
        ),
      ),
      child: Align(alignment: Alignment.topLeft, child: child),
    );
  }
}
