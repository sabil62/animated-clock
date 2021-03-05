// import 'package:flutter/cupertino.dart';
//vvi
import 'package:flutter/foundation.dart';

import '../enum.dart';

class MenuClass extends ChangeNotifier {
  MenuType menuType;
  String text;
  String assets;
  MenuClass(this.menuType, {this.text, this.assets});
  updatedMenuClass(MenuClass menuclass) {
    this.menuType = menuclass.menuType;
    this.text = menuclass.text;
    this.assets = menuclass.assets;
    //vvi
    notifyListeners();
  }
}
