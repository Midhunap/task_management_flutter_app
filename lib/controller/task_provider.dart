import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }

  final List<String> imagePaths = [
    "assets/users/img2.jpg",
    "assets/users/img3.jpg",
    "assets/users/img4.jpg",
  ];
}
