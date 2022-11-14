import 'package:ecommerce_unitone/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../all_product_controllor.dart';

class DetailProduct extends StatelessWidget {
  DetailProduct({super.key});

  AllProductControllor allProductControllor = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
            init: AllProductControllor(),
            builder: (controller) {
              return allProductControllor.isLoading1 == true
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back)),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 5.w, bottom: 20.h),
                          child: Text(
                            '${allProductControllor.selectProduct!.title}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100.h,
                            margin: EdgeInsetsDirectional.only(
                              start: 3.w,
                              end: 3.w,
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      allProductControllor
                                          .selectProduct!.images![0],
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15.r)),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 15.w),
                          child: Text(
                            '${allProductControllor.selectProduct!.price} \$',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 10.w, end: 10.w),
                          child: Text(
                            '${allProductControllor.selectProduct!.description}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        InkWell(
                          onTap: () {
                            allProductControllor.insertProductCart(
                                Tproduct.cart(
                                    id: allProductControllor.selectProduct!.id,
                                    title: allProductControllor
                                        .selectProduct!.title,
                                    price: allProductControllor
                                        .selectProduct!.price,
                                    image: allProductControllor
                                        .selectProduct!.images![0],
                                    counter: 1));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsetsDirectional.only(start: 10.w),
                            height: 50.h,
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Add to cart',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        )
                      ],
                    );
            }));
  }
}
