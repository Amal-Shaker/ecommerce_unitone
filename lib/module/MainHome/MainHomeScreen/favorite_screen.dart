import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../all_product_controllor.dart';

class FaviroteScreen extends StatelessWidget {
  FaviroteScreen({super.key});
  AllProductControllor allProductControllor = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constants.pinkColor,
        title: const Text('My Favorite Product'),
        centerTitle: true,
      ),
      body: GetBuilder(
          init: AllProductControllor(),
          builder: (controllor) {
            return allProductControllor.allFavProduct == null
                ? Container()
                : ListView.builder(
                    itemCount: allProductControllor.allFavProduct!.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(allProductControllor
                              .allFavProduct![index].image!),
                          title: Text(
                              '${allProductControllor.allFavProduct![index].title}'),
                          subtitle: Text(
                              '${allProductControllor.allFavProduct![index].price} \$'),
                          trailing: IconButton(
                              onPressed: () {
                                allProductControllor.deleteFromFavProduct(
                                    allProductControllor
                                        .allFavProduct![index].id);
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ),
                      );
                    }));
          }),
    );
  }
}
