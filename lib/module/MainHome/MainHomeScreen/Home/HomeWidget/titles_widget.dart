import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleWidget extends StatelessWidget {
  CustomTitleWidget({this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsetsDirectional.only(start: 8.w, top: 8.h),
      child: Text(
        title!,
        style: TextStyle(
            color: Colors.pink[200], fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ));
  }
}
