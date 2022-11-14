import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryItem extends StatelessWidget {
  CustomCategoryItem({Key? key, this.image, this.name, this.onTap})
      : super(key: key);
  String? image;
  String? name;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15.r)),
        margin: EdgeInsetsDirectional.only(start: 15.w, top: 5.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image!))),
              height: 80,
              width: 100,
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text(
                name!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
