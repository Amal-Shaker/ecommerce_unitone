import 'package:ecommerce_unitone/Helper/db_helper.dart';
import 'package:ecommerce_unitone/model/product.dart';
import 'package:get/get.dart';

import '../../Api/Repo/category_repo.dart';
import '../../Api/Repo/product_repo.dart';

class AllProductControllor extends GetxController {
  bool isLoading = false;
  bool isLoading1 = false;
  List<Tproduct>? allProduct = [];
  List<Category>? allCategory = [];

  List<Tproduct>? allFavProduct = [];
  List<Tproduct>? allCartProduct = [];
  List<Tproduct>? allProductByCategory = [];
  Tproduct? selectProduct;
  int totalPrice = 0;
  getAllProduct() async {
    isLoading = true;
    update();
    allProduct = await ProductRepo.instance.getProductRequest();
    isLoading = false;
    update();
  }

  getAllCategory() async {
    isLoading = true;
    update();
    allCategory = await CategoryRepo.instance.getAllCategoryRequest();
    isLoading = false;
    update();
  }

  getProductById(int? id) async {
    isLoading1 = true;
    update();
    selectProduct = await ProductRepo.instance.getProductByIdRequest(id);
    isLoading1 = false;
    update();
  }

  getProductByCategory(int? id) async {
    isLoading1 = true;
    update();
    allProductByCategory =
        await CategoryRepo.instance.getProductByCategoryRequest(id);
    isLoading1 = false;
    update();
  }

  getAllFavProduct() async {
    allFavProduct = await DbHelper.instance.getAllFavorite();
    update();
  }

  insertFavProduct(Tproduct product) async {
    await DbHelper.instance.insertFavorite(product);
    getAllFavProduct();
    update();
  }

  deleteFromFavProduct(int? id) async {
    await DbHelper.instance.deleteFavorite(id!);
    getAllFavProduct();
    update();
  }

  bool checkIsFav(int? id) {
    bool isFav = false;
    if (allFavProduct!.isEmpty || allFavProduct == null) {
      isFav = false;
    } else {
      allFavProduct!.map((e) {
        if (e.id == id) {
          isFav = true;
        }
      }).toList();
    }
    return isFav;
  }

  calculateTotalPrice() {
    totalPrice = 0;
    if (allCartProduct!.isEmpty || allCartProduct == null) {
      return;
    } else {
      allCartProduct!.map((e) {
        totalPrice = totalPrice + (e.counter! * e.price!);
        update();
      }).toList();
    }
    update();
  }

  getAllProductCart() async {
    allCartProduct = await DbHelper.instance.getAllCart();
    calculateTotalPrice();
    update();
  }

  deleteProductCart(int id) async {
    await DbHelper.instance.deleteCart(id);
    getAllProductCart();
    update();
  }

  insertProductCart(Tproduct product) async {
    bool exist = false;
    allCartProduct!.map((e) {
      if (e.id == product.id) {
        exist = true;
      }
    }).toList();
    if (exist == false) {
      await DbHelper.instance.insertCart(product);
    }
    getAllProductCart();
    update();
  }

  // updateProductCart(Tproduct product) async {
  //   await DbHelper.instance.updateCart(product);
  //   getAllProductCart();
  //   update();
  // }

  increaseNumber(Tproduct product) async {
    product.counter = product.counter! + 1;
    await DbHelper.instance.updateCart(product);
    getAllProductCart();
    calculateTotalPrice();
    update();
  }

  decreaseNumber(Tproduct product) async {
    product.counter = product.counter! - 1;
    product.counter == 0
        ? deleteProductCart(product.id!)
        : await DbHelper.instance.updateCart(product);
    getAllProductCart();
    calculateTotalPrice();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllProduct();
    getAllFavProduct();
    getAllProductCart();
    // calculateTotalPrice();
    getAllCategory();
    super.onInit();
  }
}

//F4C8E3
//F8E1EF