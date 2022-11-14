import 'package:ecommerce_unitone/model/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  //DbHelper._();
  static var instance = DbHelper();

  Database? database;

  static const String dbName = 'store.db';
  static const String tableName1 = 'favorite';
  static const String tableName2 = 'cart';
  String id = 'id';
  String title = 'title';
  String price = 'price';
  String image = 'image';
  String counter = 'counter';

  intDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Database database = await openDatabase(
      join(await getDatabasesPath(), '$dbName'),
      version: 1,
      onCreate: (db, v) {
        db.execute(
            '''CREATE TABLE $tableName1 ($id INTEGER PRIMARY KEY, $title TEXT,$price INTEGER,$image TEXT)''');

        db.execute(
            '''CREATE TABLE $tableName2 ($id INTEGER PRIMARY KEY, $title TEXT,$price INTEGER,$image TEXT,$counter Integer)''');

        // db.execute(
        //     '''CREATE TABLE $tableName2 ($id INTEGER PRIMARY KEY AUTOINCREMENT , $category_id INTEGER REFERENCES $tableName1($id),$price DOUBLE)''');
      },
      onOpen: (db) => print('DB is opened'),
    );

    return database;
  }

  insertFavorite(Tproduct product) async {
    int numRaw = await database!.insert(tableName1, product.toJson1());
    print(numRaw);
  }

  deleteFavorite(int id) async {
    await database!.delete(tableName1, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Tproduct>> getAllFavorite() async {
    List<Map<String, Object?>> results = await database!.query(tableName1);
    List<Tproduct>? product = results.map((e) {
      return Tproduct.fromJson1(e);
    }).toList();
    return product;
  }

  insertCart(Tproduct product) async {
    int numRaw = await database!.insert(tableName2, product.toJsonCart());
    print(numRaw);
  }

  deleteCart(int id) async {
    await database!.delete(tableName2, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Tproduct>> getAllCart() async {
    List<Map<String, Object?>> results = await database!.query(tableName2);
    List<Tproduct>? product = results.map((e) {
      return Tproduct.fromJsonCart(e);
    }).toList();
    return product;
  }

  updateCart(Tproduct product) async {
    await database!.update(tableName2, product.toJsonCart(),
        where: 'id=?', whereArgs: [product.id]);
  }
  // insertExpenses(Expenses expenses) async {
  //   int numRaw = await database!.insert(tableName2, expenses.toJson());
  //   print(numRaw);
  // }

  // insertExpensesDetails(DetailExpenses detailsexpenses) async {
  //   int numRaw = await database!.insert(tableName3, detailsexpenses.toJson());
  //   print(numRaw);
  // }

  // Future<List<Category>> getAllCategory() async {
  //   List<Map<String, Object?>> results = await database!.query(tableName1);
  //   List<Category>? category = results.map((e) {
  //     return Category.fromJson(e);
  //   }).toList();
  //   return category;
  // }

  // Future<double> getTotalExpenses() async {
  //   double total = 0;

  //   List<Map<String, Object?>> results = await database!.query(tableName2);
  //   results.map((e) {
  //     total = total + Expenses.fromJson(e).price!;
  //   }).toList();
  //   return total;
  // }

  // Future<List<Expenses>> getAllExpenses() async {
  //   List<Map<String, Object?>> results = await database!.query(tableName2);
  //   List<Expenses>? expenses = results.map((e) {
  //     return Expenses.fromJson(e);
  //   }).toList();
  //   return expenses;
  // }

  // Future<List<DetailExpenses>> getAllDetailsExpenses() async {
  //   List<Map<String, Object?>> results = await database!.query(tableName3);
  //   List<DetailExpenses>? detailsexpenses = results.map((e) {
  //     return DetailExpenses.fromJson(e);
  //   }).toList();
  //   return detailsexpenses;
  // }

  // updateExpenses(Expenses expenses) async {
  //   await database!.update(tableName2, expenses.toJson(),
  //       where: 'id=?', whereArgs: [expenses.id]);
  // }

  // Future<Category> getCategoryById(int? id) async {
  //   List<Map<String, Object?>> results =
  //       await database!.query(tableName1, where: 'id=?', whereArgs: [id]);
  //   Category category = Category.fromJson(results[0]);

  //   return category;
  // }
}


/**
 *   deleteNote(int id) async {
    await database.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  updateNote(Notes note) async {
    await database
        .update(tableName, note.toMap(), where: 'id=?', whereArgs: [note.id]);
  }
 */