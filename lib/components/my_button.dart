import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.sp),
        // margin: ,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Theme.of(context).colorScheme.background,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
