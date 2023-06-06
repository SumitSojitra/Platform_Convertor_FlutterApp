import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/model/model.dart';

class Platform_Provider extends ChangeNotifier {
  bool switc = true;
  bool profile = false;
  bool theme = false;
  void changeSwitch(bool n) {
    switc = n;
    notifyListeners();
  }

  void Profile(bool n) {
    profile = n;
    notifyListeners();
  }

  void Theme(bool n) {
    theme = n;
    notifyListeners();
  }

  int page = 0;
  void changePage(int n) {
    page = n;
    notifyListeners();
  }

  File? img;
  void imagePick(File n) {
    img = n;
    notifyListeners();
  }

  bool iosprofile = false;
  bool iostheme = false;
  void iosProfile(bool n) {
    iosprofile = n;
    notifyListeners();
  }

  void iosTheme(bool n) {
    iostheme = n;
    notifyListeners();
  }
}

class Globals {
  static List<allInformation> alldetail = [];
  static List<iosInformation> iosDetails = [];
}
