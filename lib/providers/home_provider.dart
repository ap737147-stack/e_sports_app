import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int selectedGameMode = 0;

  get selectedTab => null; // 0 = Arena, 1 = Zenith, 2 = Championship

  void changeGameMode(int index) {
    selectedGameMode = index;
    notifyListeners();
  }

  void changeTab(int index) {}
}
