import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItem extends StatelessWidget {
  CustomProductItem(
      {this.image,
      this.price,
      this.title,
      this.onTap,
      this.favIcon,
      this.icon});
  String? image;
  String? title;
  int? price;
  Function()? onTap;
  Function()? favIcon;
  Icon? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[200]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r)),
                    image: DecorationImage(
                        image: NetworkImage(image!), fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 5.h),
              child: Text(title!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${price} \$'),
                  IconButton(onPressed: favIcon, icon: icon!)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
