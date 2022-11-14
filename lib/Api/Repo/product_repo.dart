import 'package:dio/dio.dart';

import '../../model/product.dart';
import '../Controllor/product_controllor.dart';

class ProductRepo {
  static var instance = ProductRepo();

  Future<List<Tproduct>> getProductRequest() async {
    Response response = await ProductControllor.getProductList();
    List<Tproduct> allProduct = [];
    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          allProduct.add(Tproduct.fromJson(element));
        },
      );
    }
    return allProduct;
  }

  Future<Tproduct> getProductByIdRequest(int? id) async {
    Response response = await ProductControllor.getProductById(id);
    Tproduct? selectProduct;
    if (response.statusCode == 200) {
      selectProduct = Tproduct.fromJson(response.data);
    }
    return selectProduct!;
  }
}
