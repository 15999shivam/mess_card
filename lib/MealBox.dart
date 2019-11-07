import 'package:flutter/material.dart';

class MealBox extends StatelessWidget {
  MealBox({this.isChecked, this.onChange});
  final isChecked;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: onChange,
      value: isChecked,
    );
  }
}
