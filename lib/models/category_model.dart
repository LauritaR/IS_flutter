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
            name: 'Studijos',
            iconPath: 'assets/icons/studijos.svg',
            boxColor: Color(0x3c490f0f))
    );
    categories.add(
        CategoryModel(
            name: 'Registracijos',
            iconPath: 'assets/icons/registracijos.svg',
            boxColor: Color(0x3c490f0f)));
    categories.add(
        CategoryModel(
            name: 'Rašto darbai',
            iconPath: 'assets/icons/rasto.svg',
            boxColor: Color(0x3c490f0f)));
    categories.add(
        CategoryModel(
            name: 'Finansai',
            iconPath: 'assets/icons/finansai.svg',
            boxColor: Color(0x3c490f0f)));
    categories.add(
        CategoryModel(
            name: 'ePrašymai',
            iconPath: 'assets/icons/prasymai.svg',
            boxColor: Color(0x3c490f0f)));
    categories.add(
        CategoryModel(
            name: 'Apklausos',
            iconPath: 'assets/icons/apklausos.svg',
            boxColor: Color(0x3c490f0f)));
    categories.add(
        CategoryModel(
            name: 'Karjera',
            iconPath: 'assets/icons/karjera.svg',
            boxColor: Color(0x3c490f0f)));
    return categories;
  }
}