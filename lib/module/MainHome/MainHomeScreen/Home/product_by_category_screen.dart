import 'package:ecommerce_unitone/Constants/constants.dart';
import 'package:ecommerce_unitone/module/MainHome/all_product_controllor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../model/product.dart';
import 'detail_page.dart';
import 'HomeWidget/custom_product_item.dart';

class AllProductByCategory extends StatelessWidget {
  AllProductByCategory({Key? key, this.categoryName}) : super(key: key);
  String? categoryName;
  AllProductControllor allProductControllor = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.pinkColor,
        title: Text('$categoryName Product'),
        centerTitle: true,
      ),
      body: GetBuilder(
          init: AllProductControllor(),
          builder: (controllor) {
            return allProductControllor.allProductByCategory == null ||
                    allProductControllor.allProductByCategory!.isEmpty
                ? const CircularProgressIndicator()
                : Container(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                    child: GridView.builder(
                        itemCount:
                            allProductControllor.allProductByCategory!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.h,
                            crossAxisSpacing: 8.w),
                        itemBuilder: (context, index) {
                          return CustomProductItem(
                            favIcon: () {
                              int? id =
                                  allProductControllor.allProduct![index].id;
                              allProductControllor.checkIsFav(id)
                                  ? allProductControllor
                                      .deleteFromFavProduct(id)
                                  : allProductControllor.insertFavProduct(
                                      Tproduct.fav(
                                          id: allProductControllor
                                              .allProduct![index].id,
                                          title: allProductControllor
                                              .allProduct![index].title,
                                          price: allProductControllor
                                              .allProduct![index].price,
                                          image: allProductControllor
                                              .allProduct![index].images![0]));
                            },
                            onTap: () {
                              allProductControllor.getProductById(
                                  allProductControllor.allProduct![index].id);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailProduct()));
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: allProductControllor.checkIsFav(
                                      allProductControllor
                                          .allProduct![index].id)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                            image: allProductControllor
                                .allProduct![index].images![0],
                            title:
                                allProductControllor.allProduct![index].title,
                            price:
                                allProductControllor.allProduct![index].price,
                          );
                        }),
                  );
          }),
    );
  }
}
