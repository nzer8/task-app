import 'package:flutter/material.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView({
    Key? key,
    this.textInputType,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.suffix,
    required this.hintStyle,
  }) : super(key: key);

  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String hintText;
  final TextStyle hintStyle;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          prefix != null
              ? Padding(padding: EdgeInsets.all(8.0), child: prefix!)
              : const SizedBox(),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              controller: controller,
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintStyle: hintStyle,
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          suffix != null
              ? Padding(padding: EdgeInsets.all(8.0), child: suffix!)
              : const SizedBox(),
        ],
      ),
    );
  }
}
