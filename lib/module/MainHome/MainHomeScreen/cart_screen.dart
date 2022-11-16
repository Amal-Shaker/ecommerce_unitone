import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../all_product_controllor.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  AllProductControllor allProductControllor = Get.put(AllProductControllor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constants.pinkColor,
        title: const Text('My Cart Product'),
        centerTitle: true,
      ),
      body: GetBuilder(
          init: AllProductControllor(),
          builder: (controllor) {
            return allProductControllor.allCartProduct == null ||
                    allProductControllor.allCartProduct!.isEmpty
                ? Container()
                : Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: ListView.builder(
                            itemCount:
                                allProductControllor.allCartProduct!.length,
                            itemBuilder: ((context, index) {
                              return Card(
                                child: ListTile(
                                  leading: Image.network(allProductControllor
                                      .allCartProduct![index].image!),
                                  title: Text(
                                      '${allProductControllor.allCartProduct![index].title}'),
                                  subtitle: Text(
                                      '${allProductControllor.allCartProduct![index].price} \$'),
                                  trailing: Container(
                                    width: 60.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              allProductControllor
                                                  .increaseNumber(
                                                      allProductControllor
                                                              .allCartProduct![
                                                          index]);
                                            },
                                            child: const Icon(Icons.add)),
                                        Text(
                                            '${allProductControllor.allCartProduct![index].counter}'),
                                        InkWell(
                                            onTap: () {
                                              allProductControllor
                                                  .decreaseNumber(
                                                      allProductControllor
                                                              .allCartProduct![
                                                          index]);
                                            },
                                            child: const Icon(Icons.remove))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(start: 10.w),
                              width: 100.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Colors.pink[200],
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: const Center(child: Text('Total Price:')),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  start: 10.w, end: 10.w),
                              width: 100.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Center(
                                  child: Text(
                                      '${allProductControllor.totalPrice} \$')),
                            )
                          ],
                        ),
                      )
                    ],
                  );
          }),
    );
  }
}
