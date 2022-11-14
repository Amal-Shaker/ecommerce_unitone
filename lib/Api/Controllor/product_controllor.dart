import 'package:dio/dio.dart';

import '../../Helper/dio_helper.dart';

class ProductControllor {
  static Future<Response> getProductList() {
    return DioHelper().get('/products');
  }

  static Future<Response> getProductById(int? id) {
    return DioHelper().get('/products/$id');
  }
}
