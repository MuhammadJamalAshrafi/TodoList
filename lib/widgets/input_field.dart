import 'package:flutter/material.dart';
import 'package:todo_list/base/styles.dart';

class InputField extends StatelessWidget {
  final String title;
  final double height;
  const InputField({
    Key? key,
    required this.title,
    this.height = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: appSecondaryColor, width: 2),
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const ImageIcon(AssetImage("images/edit.png"), size: 18, color: appSecondaryColor),
            hintText: title,
            hintStyle: const TextStyle(color: appSecondaryColor, fontSize: 18, fontFamily: "Poppins", fontWeight: FontWeight.w400),
            border: InputBorder.none
        ),
      ),
    );
  }
}
