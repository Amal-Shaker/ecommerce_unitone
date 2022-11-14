import 'package:dio/dio.dart';

import '../../Helper/dio_helper.dart';

class CategoryControllor {
  static Future<Response> getCategoryList() {
    return DioHelper().get('/categories');
  }

  static Future<Response> getAllProductByCategory(int? id) {
    return DioHelper().get('/categories/$id/products');
  }
}
