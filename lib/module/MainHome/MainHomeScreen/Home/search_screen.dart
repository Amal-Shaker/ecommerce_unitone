import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../model/product.dart';
import '../../all_product_controllor.dart';
import 'HomeWidget/custom_product_item.dart';
import 'detail_page.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController? textcontrollor = TextEditingController();
  AllProductControllor allProductControllor = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: AllProductControllor(),
          builder: ((controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsetsDirectional.only(
                    start: 16.w,
                    end: 16.w,
                  ),
                  child: TextField(
                      controller: textcontrollor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 3, color: Constants.pinkColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 2, color: Constants.pinkColor)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Constants.pinkColor,
                        ),
                        hintText: 'Product Title',
                      ),
                      onChanged: allProductControllor.searchProduct),
                )),
                Expanded(
                  flex: 7,
                  child: allProductControllor.allProduct1!.isEmpty
                      ? Container()
                      : Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: GridView.builder(
                              itemCount:
                                  allProductControllor.allProduct1!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5.h,
                                      crossAxisSpacing: 8.w),
                              itemBuilder: (context, index) {
                                return CustomProductItem(
                                  favIcon: () {
                                    int? id = allProductControllor
                                        .allProduct1![index].id;
                                    allProductControllor.checkIsFav(id)
                                        ? allProductControllor
                                            .deleteFromFavProduct(id)
                                        : allProductControllor.insertFavProduct(
                                            Tproduct.fav(
                                                id: allProductControllor
                                                    .allProduct1![index].id,
                                                title: allProductControllor
                                                    .allProduct1![index].title,
                                                price: allProductControllor
                                                    .allProduct1![index].price,
                                                image: allProductControllor
                                                    .allProduct1![index]
                                                    .images![0]));
                                    print(allProductControllor.checkIsFav(
                                        allProductControllor
                                            .allProduct1![index].id));
                                  },
                                  onTap: () {
                                    allProductControllor.getProductById(
                                        allProductControllor
                                            .allProduct1![index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProduct()));
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: allProductControllor.checkIsFav(
                                            allProductControllor
                                                .allProduct1![index].id)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                  image: allProductControllor
                                      .allProduct1![index].images![0],
                                  title: allProductControllor
                                      .allProduct1![index].title,
                                  price: allProductControllor
                                      .allProduct1![index].price,
                                );
                              }),
                        ),
                )
              ],
            );
          })),
    );
  }
}
