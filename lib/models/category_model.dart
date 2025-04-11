import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
  {
   required this.name,
    required this.iconPath,
    required this.boxColor,
}
      );
  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];
    
    categories.add(
        CategoryModel(
            name: 'Salad',
            iconPath: 'assets/icons/filter.svg',
            boxColor: Color(0xff92A3FD))
    );

    categories.add(
        CategoryModel(
            name: 'Cake',
            iconPath: 'assets/icons/filter.svg',
            boxColor: Color(0xff92fdb7)));
    categories.add(
        CategoryModel(
            name: 'Pie',
            iconPath: 'assets/icons/filter.svg',
            boxColor: Color(0xffe6fd92)));
    categories.add(
        CategoryModel(
            name: 'Cepelinai',
            iconPath: 'assets/icons/filter.svg',
            boxColor: Color(0xfff292fd)));

    return categories;
  }
}