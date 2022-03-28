import 'package:flutter/material.dart';
import 'package:todo_list/base/styles.dart';

class AppButton extends StatelessWidget {
  final String name;
  const AppButton({
    Key? key,
    required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
          color: appPrimaryColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Text(name, style: TextStyle(fontSize: 18, fontFamily: "Poppins", fontWeight: FontWeight.w500, color: Colors.white)),
    );
  }
}
