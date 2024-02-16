import 'package:flutter/material.dart';

class favrouriteItemProvider extends ChangeNotifier{

  List<int> _selectedItem=[];

  List<int> get selectedItem =>_selectedItem;  //gettor method ,int rakheko mathi ko list int bhayera

  void addItem(int value){
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    _selectedItem.remove(value);
    notifyListeners();
  }
}