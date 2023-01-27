

import 'package:app_flowers2/pages/model.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier{
  double price =0;
List selectedproduct = [];
 addProduct(Item product){
  selectedproduct.add(product);
  price+= product.price.round();
  notifyListeners();
 }
  removeProduct(Item product){
  selectedproduct.remove(product);
  price-= product.price.round();
  notifyListeners();
 }

}