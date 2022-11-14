import 'package:dio/dio.dart';

import '../../model/product.dart';
import '../Controllor/category_controllor.dart';
import '../Controllor/product_controllor.dart';

class CategoryRepo {
  static var instance = CategoryRepo();

  Future<List<Category>> getAllCategoryRequest() async {
    Response response = await CategoryControllor.getCategoryList();
    List<Category> allCategory = [];
    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          allCategory.add(Category.fromJson(element));
        },
      );
    }
    return allCategory;
  }

  Future<List<Tproduct>> getProductByCategoryRequest(int? id) async {
    Response response = await CategoryControllor.getAllProductByCategory(id);
    List<Tproduct> allProductByCategory = [];

    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          allProductByCategory.add(Tproduct.fromJson(element));
        },
      );
    }

    return allProductByCategory;
  }
}
