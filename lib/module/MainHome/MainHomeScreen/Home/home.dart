import 'package:ecommerce_unitone/model/product.dart';
import 'package:ecommerce_unitone/module/MainHome/MainHomeScreen/Home/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import 'HomeWidget/custome_category_item.dart';
import 'product_by_category_screen.dart';
import 'HomeWidget/titles_widget.dart';
import '../../all_product_controllor.dart';
import 'detail_page.dart';
import 'HomeWidget/custom_product_item.dart';

class Home extends StatelessWidget {
  Home({super.key});
  AllProductControllor allProductControllor = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constants.pinkColor,
        title: const Text('All Product'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: GetBuilder(
          init: AllProductControllor(),
          builder: (controllor) {
            return allProductControllor.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitleWidget(
                        title: 'Categores',
                      ),
                      Expanded(
                          flex: 3,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  allProductControllor.allCategory!.length,
                              itemBuilder: (context, index) {
                                return CustomCategoryItem(
                                  onTap: () {
                                    allProductControllor.getProductByCategory(
                                        allProductControllor
                                            .allCategory![index].id);

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AllProductByCategory(
                                                  categoryName:
                                                      allProductControllor
                                                          .allCategory![index]
                                                          .name,
                                                )));
                                  },
                                  name: allProductControllor
                                      .allCategory![index].name,
                                  image: allProductControllor
                                      .allCategory![index].image,
                                );
                              })),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTitleWidget(
                        title: 'All Product',
                      ),
                      Expanded(
                        flex: 13,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 10.h),
                          child: GridView.builder(
                              itemCount:
                                  allProductControllor.allProduct!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5.h,
                                      crossAxisSpacing: 8.w),
                              itemBuilder: (context, index) {
                                return CustomProductItem(
                                  favIcon: () {
                                    int? id = allProductControllor
                                        .allProduct![index].id;
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
                                                    .allProduct![index]
                                                    .images![0]));
                                    print(allProductControllor.checkIsFav(
                                        allProductControllor
                                            .allProduct![index].id));
                                  },
                                  onTap: () {
                                    allProductControllor.getProductById(
                                        allProductControllor
                                            .allProduct![index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProduct()));
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
                                  title: allProductControllor
                                      .allProduct![index].title,
                                  price: allProductControllor
                                      .allProduct![index].price,
                                );
                              }),
                        ),
                      ),
                    ],
                  );
          }),
    );
  }
}
