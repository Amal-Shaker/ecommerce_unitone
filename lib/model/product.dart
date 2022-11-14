class Tproduct {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  String? image;
  int? counter;

  Tproduct(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});
  Tproduct.fav({this.id, this.title, this.price, this.image});
  Tproduct.cart({this.id, this.title, this.price, this.image, this.counter});

  Tproduct.fromJson1(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }
  Tproduct.fromJsonCart(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
    counter = json['counter'];
  }

  Map<String, dynamic> toJson1() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }

  Map<String, dynamic> toJsonCart() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    data['counter'] = this.counter;
    return data;
  }

  Tproduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['images'] = this.images;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
