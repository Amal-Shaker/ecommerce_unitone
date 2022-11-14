import 'package:flutter/material.dart';

import '../Helper/db_helper.dart';

class Application {
  static intApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DbHelper.instance.intDatabase();
  }
}
